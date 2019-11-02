require 'utilities/web/http_engine'

module IRacing
  class SendLogInRequest
    HEADERS = { 'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17', 'Referer': 'https://members.iracing.com/membersite/login.jsp', 'Connection': 'keep-alive', 'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8','Accept-Charset': 'ISO-8859-1,utf-8;q=0.7,*;q=0.3','Cache-Control': 'max-age=0', 'Host': 'members.iracing.com','Accept-Encoding': 'gzip,deflate,sdch','Cookies': 'JSESS_members-membersite-bosdkr03-2=EF6B2A3EF896795BEE16142887CDA67A; JSESS_members-membersite-bosdkr02-2=58EFF2D0C7A7BFFC500A998BA74CCAEB; JSESS_members-membersite-bosdkr03-1=9CF4C1345BFD04CAD11306C2449D0B26; JSESS_members-membersite-bosdkr02-1=C876E2F13EF9097A0589C7260ED83161; JSESS_members-membersite-bosdkr04-1=8CC53319240F13EB6B342DF2160640D8; JSESS_members-membersite-tc03-1=8F0ED609BA9BDD5C19D533F8C93143F6; _ga=GA1.2.238529886.1570480482; XROUTE_UID=AAAAAV28jzOKtSbPYmfPAg==; _gid=GA1.2.308938198.1572638560; XSESSIONID=ATC03a|Xby/t|XbyPN; AWSALB=aAL/fO1PR37r5YqJAi1km/njTQOh1VHvyqmDrrbxvaC69ltAbGYfXGTDELhn7JQCJWrDP5y9A2B++rh4f+Kyhvf1jYc53G2s0g3T/QYkhuGK9RWqlckaPkERaUWw', 'Origin': 'members.iracing.com', 'Accept-Language': 'en-US,en;q=0.8'}.freeze
    def call(username:, password:)
      encodedUsername = username.encode("iso-8859-1").force_encoding("utf-8")
      encodedPassword = password.encode("iso-8859-1").force_encoding("utf-8")
      HTTPEngine.new.send_post_request(url: url(username,password), body: { username: encodedUsername, password: encodedPassword }, headers: HEADERS)
    end

    private

    def url(username, password)
      "https://members.iracing.com/membersite/Login".freeze
    end

  end
end
