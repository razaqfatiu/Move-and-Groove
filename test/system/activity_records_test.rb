require "application_system_test_case"

class ActivityRecordsTest < ApplicationSystemTestCase
  setup do
    @activity_record = activity_records(:one)
  end

  test "visiting the index" do
    visit activity_records_url
    assert_selector "h1", text: "Activity Records"
  end

  test "creating a Activity record" do
    visit activity_records_url
    click_on "New Activity Record"

    click_on "Create Activity record"

    assert_text "Activity record was successfully created"
    click_on "Back"
  end

  test "updating a Activity record" do
    visit activity_records_url
    click_on "Edit", match: :first

    click_on "Update Activity record"

    assert_text "Activity record was successfully updated"
    click_on "Back"
  end

  test "destroying a Activity record" do
    visit activity_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Activity record was successfully destroyed"
  end
end
