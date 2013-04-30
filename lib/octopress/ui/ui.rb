# encoding: utf-8
require 'sinatra/base'
require 'ruby-pinyin'

$root = ::File.dirname(__FILE__)

module Octopress
  module Ui
    class UIServer < Sinatra::Base

      def save_post
        return nil if params[:title] == "" || params[:content] == ""
        title = PinYin.permlink(params[:title])
        filename = File.join($root, 'source', '_posts', "#{Time.now.strftime('%Y-%m-%d')}-#{title}.markdown")
        FileUtils.touch(filename) unless File.exists?(filename)
        File.open(filename, 'w') do |file|
          file.puts "---"
          file.puts "layout: post"
          file.puts "title: #{params[:title]}"
          file.puts "---"
          file.puts ""

          file.write params[:content]
        end
        p system('rake generate')
      end

      get '/admin' do
        #p 999, settings.static, settings.public_dir, settings.public_folder
        erb :index
      end

      post '/preview' do
        save_post
        "ok"
      end

      post '/admin' do
        return "error" unless save_post
        p system('rake "deploy"')
        p system('git add .')
        p system("git commit -am 'add post #{params[:title]}'")
        p system("git push origin source")
        "发布成功,请到 <a href='http://jindan-programming.github.io/'>金丹的程序之路</a> 查看"
      end

      run! if app_file == $0
    end

  end
end
