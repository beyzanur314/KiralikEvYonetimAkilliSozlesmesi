pragma solidity ^0.8.0;

contract KiralikEveDukkanSozlesmesi {
    address public sahip;
    string public kiralikYerTipi;
    address public kiraci;
    uint256 public kiraBaslangicTarihi;
    uint256 public kiraBitisTarihi;
    bool public kiralikDurum;
    
    constructor(string memory _kiralikYerTipi, address _kiraci, uint256 _kiraBaslangicTarihi, uint256 _kiraBitisTarihi) {
        sahip = msg.sender;
        kiralikYerTipi = _kiralikYerTipi;
        kiraci = _kiraci;
        kiraBaslangicTarihi = _kiraBaslangicTarihi;
        kiraBitisTarihi = _kiraBitisTarihi;
        kiralikDurum = true;
    }
    
    modifier sadeceSahip() {
        require(msg.sender == sahip, "Sadece sahip cagirabilir.");
        _;
    }
    
    modifier kiralikDurumKontrol() {
        require(kiralikDurum == true, "Kira sozlesmesi sona ermis.");
        _;
    }
    
    function kirayaVer() public sadeceSahip kiralikDurumKontrol {
        kiralikDurum = false;
    }
    
    function kiraSonlandir() public sadeceSahip {
        kiralikDurum = false;
    }
    
    function hataliDurumBildir() public {
        require(msg.sender == kiraci, "Sadece kiraci hatali durum bildirebilir.");
        // Burada hatali durumu isleyebilir ve gerekli yaptirimlari uygulayabilirsiniz.
    }
}
