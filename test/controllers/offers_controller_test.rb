require 'test_helper'

class OffersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offer = offers(:o_one)
  end

  test "has a picture" do
    assert File.exists?(@offer.picture.file.path)
  end

  test "uploads a picture" do
    offer = Offer.create!(:picture, fixture_file_upload('/files/tapir.jpg', 'image/jpg'))
    assert(File.exists?(offer.reload.picture.file.path))
  end

  test "should get index" do
    get offers_url
    assert_response :success
  end

  test "should get new" do
    get new_offer_url
    assert_response :success
  end

  test "should create offer" do
    assert_difference('Offer.count') do
      post offers_url, params: { offer: { customer: @offer.customer, expire: @offer.expire, user: @offer.user, picture: @offer.picture } }
    end

    assert_redirected_to offer_url(Offer.last)
  end

  test "should show offer" do
    get offer_url(@offer)
    assert_response :success
  end

  test "should get edit" do
    get edit_offer_url(@offer)
    assert_response :success
  end

  test "should update offer" do
    patch offer_url(@offer), params: { offer: { customer: @offer.customer, expire: @offer.expire, user: @offer.user, picture: @offer.picture } }
    assert_redirected_to offer_url(@offer)
  end

  test "should destroy offer" do
    assert_difference('Offer.count', -1) do
      delete offer_url(@offer)
    end

    assert_redirected_to offers_url
  end
end
