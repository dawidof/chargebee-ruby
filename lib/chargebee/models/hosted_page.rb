module ChargeBee
  class HostedPage < Model

  attr_accessor :id, :type, :url, :state, :failure_reason, :pass_thru_content, :embed, :created_at,
  :expires_at, :updated_at, :resource_version, :checkout_info

  class Content < Result
  end

  def content
    if @values[:content].nil?
        nil
    else
        Content.new(@values[:content])
    end
  end

  # OPERATIONS
  #-----------

  def self.checkout_new(params, env=nil, headers={})
    Request.send('post', uri_path("hosted_pages","checkout_new"), params, env, headers)
  end

  def self.checkout_existing(params, env=nil, headers={})
    Request.send('post', uri_path("hosted_pages","checkout_existing"), params, env, headers)
  end

  def self.update_card(params, env=nil, headers={})
    Request.send('post', uri_path("hosted_pages","update_card"), params, env, headers)
  end

  def self.update_payment_method(params, env=nil, headers={})
    Request.send('post', uri_path("hosted_pages","update_payment_method"), params, env, headers)
  end

  def self.acknowledge(id, env=nil, headers={})
    Request.send('post', uri_path("hosted_pages",id.to_s,"acknowledge"), {}, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("hosted_pages",id.to_s), {}, env, headers)
  end

  def self.list(params={}, env=nil, headers={})
    Request.send_list_request('get', uri_path("hosted_pages"), params, env, headers)
  end

  end # ~HostedPage
end # ~ChargeBee