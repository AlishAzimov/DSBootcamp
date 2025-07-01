import pytest
from financial import get_page

def test_total_revenue_exists():
    result = get_page("MSFT", "Total Revenue")
    assert isinstance(result, tuple)
    assert result[0] == "Total Revenue"
    assert len(result) > 1

def test_return_type_is_tuple():
    result = get_page("AAPL", "Total Revenue")
    assert isinstance(result, tuple)

def test_invalid_ticker_raises():
    with pytest.raises(Exception):
        get_page("INVALIDTICKER", "Total Revenue")

def test_invalid_field_raises():
    with pytest.raises(Exception):
        get_page("MSFT", "Unknown Field")