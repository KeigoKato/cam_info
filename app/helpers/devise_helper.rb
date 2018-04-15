module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    html = ""
    message = ""
    messages = resource.errors.full_messages.each do |errmsg|
      case errmsg
      when "Email can't be blank" then
        message = "メールアドレスを記入してください"
      when "Password can't be blank" then
        message = "パスワードを入力してください"
      when "Nickname can't be blank" then
        message = "ユーザー名を入力してください"
      when "Password confirmation doesn't match Password" then
        message = "パスワードが一致しません"
      when "Password is too short (minimum is 6 characters)" then
        message = "パスワードは6文字以内で記入してください"
      end
      # 先頭のEOFから次のEOFまでを文字列として変数に代入する
      html += <<-EOF
      <div class="alert alert-danger alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert">
          <span aria-hidden="true">&times;</span>
          <span class="sr-only">close</span>
        </button>
        #{message}
      </div>
      EOF
    end
    # エスケープしない
    html.html_safe
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end

end
