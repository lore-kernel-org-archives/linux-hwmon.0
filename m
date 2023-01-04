Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0AFC4332F
	for <linux-hwmon@archiver.kernel.org>; Wed,  4 Jan 2023 06:10:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbjADGKX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 4 Jan 2023 01:10:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233264AbjADGJ6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 4 Jan 2023 01:09:58 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 72FD618396
        for <linux-hwmon@vger.kernel.org>; Tue,  3 Jan 2023 22:09:55 -0800 (PST)
IronPort-SDR: 4oaXXng61TEruC+obcE3Na4GfZAaeV+c+aG5wrESnEFgX1fr9f2TJeq1rNdSrHHMgXhnz9q+ow
 5uLu0jzpFZdZhamLiw7f9RNq3+j23cRwN0QEqhcI0c9T8dj1c1Q+egBbL13EnjrS6+HREF+MO2
 lZJBv714EUUaP1f20CpGTnvlMAmoYet6vcckJcClrPIyjUSAkIafcR5CvN476lT7Wg/bJzfIUd
 zzPI8mo0IMytfXYPRiHvBRTA8oEzyMXsdVIAI6iN2hGTSqoeDHpMEegjIC688UqwPqf6FJIoUj
 m8UxPMcQQkKSb5wQg/S92wZM
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2BeBwDfFrVjjPQc8jxaHgEBCxIMSYNzgl+1Jw8BDwEBR?=
 =?us-ascii?q?AQBAYUFhRMmOBMBAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBAQYEFAEBAQFAU?=
 =?us-ascii?q?gcLUgcLWAcHgUELgWETCwMxDYZZNgENAQE3ASiBFQGDEIMjr0CBAYIIAQEGg?=
 =?us-ascii?q?mKaZoFeCYFAi2CBEoM3gT0/gU6ED26DfIcGmRUKgT18gScOTFcDCQMHBUlAA?=
 =?us-ascii?q?wsYDRYyChMtNRZLEBsaGweBCiooFQMEBAMCBhMDIgINKDEUBCkTDScmawkCA?=
 =?us-ascii?q?yJmAwMEKC0JQAcmJDwHVjcFAwIPHzcGAwkDAh5PcS8SEgUDCxUqRwQINgUGU?=
 =?us-ascii?q?hICCA8SDyxDDkI3NhMGXAEqCw4TA1BGGW8EggwKLyicAIEIgQ6BccQRg3iBU?=
 =?us-ascii?q?J52TIFEp2CXRiChdYEYhCgCCgcWgXmBfk0fGYMiTwECAQEBDQECAQEDAQIBA?=
 =?us-ascii?q?QEJAQEBAY4dGYITjDhhOwIHCwEBAwmJW4JIAQE?=
IronPort-PHdr: A9a23:skTmexTlYdH0UsLSFIdDTHsYhNpso4vLVj580XJvo7hPbr/l9I7rI
 0LY//krgVrUG4TXrftZ2KLfqau1X2sG7N6atWwaNoZBUhgZhIAXh1kuDMLfWxLyJfK4Y3BlT
 JYbBg1u9SjjY0NeQJmWWg==
IronPort-Data: A9a23:vTWhd686ybuRajyodUA/DrUDsniTJUtcMsCJ2f8bNWPcYEJGY0x3x
 zNJXjuPOPyJYzfwKIhxadzi8EkCscXRm9JkG1Fv+C5hHypG+JeVX46QcEqgZH/KI5zJRRJsv
 stOO4LJd5lqH1bR90ynWlTDhSAsjfvSGtIQKwJl1gRZH1IMpPIJ0Eo78wIBqtc0x4D/WWthg
 PuqyyHlEAbNNwNcawr41YrT8HuDg9yq0N8olgRWiSdj4TcyP1FMZH4uDfnZw0nQG+G4LcbmL
 wr394xVy0uCl/sb5nJJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwZG8P4whlkeydx
 /1z8oWSTCN4OpfBndQ9fSgfGB4nFvVJreqvzXiX6aR/zmXMcmf3hf50BV44OpcUvOtyHCdP+
 boRNVjhbDjd36TsnOj9ELkq3Jh/RCXoFNp3VnVIwyvQC/UOSorKXKvN/9Me0TItwMFCW//DD
 yYcQWY0PUuYP0wUZj/7DroTl+6kgkDdTAFd8kysvLIZx2vpzwtIhe2F3N39IYTRFZ8Pzy50v
 Fnu+2X/HwFfNMOazjyt7H2hnKnMkDn9VYZUE6e3ntZugVuO1kQJDxAdVh6mur+/h1LWc9BTJ
 kgK8zAjhbMv70HtRd74NyBUu1ba5ltGB4AVSb1/sl3RjLHI6hqYDS4YVjFALtchsYk/WFTGy
 2NlgfvXQiVNtZnETUiQ84e0gwL1MhdMBjcNMHpsoRQ+3/Hvp4Q6jxTqR9llEbKogtCdJd0W6
 27bxMTZr+tI5fPnx5lX7niC2Gn8+cGVJuIhzlyKBzj9tl0RiJuNOtTA1LTN0RpXBK+kJrVrl
 EMVl86T/Yji5rnXzHTVKAnhNJek+L6+NyDAgRZQFp0s7FyQF5OLI9gVum0kYR05d5xYJXnyf
 EbPuAgX+IdcPT2haqoxap/Z5yUWIUrISY+NuhP8NIEmjn1NmOmvpn4Giam4hT6FraTUuftjU
 ap3iO71ZZrgNYxpzSCtW8AW2qIxyyY1yAv7HM6klUv4ieTEOybKGd/p1WdiiMhnvctoRy2Lq
 L5i2zeikEw3vBDWOHaMqtVDdTjm01BnW8it86S7idJv0iI9QDpxUaWAqV/QU5B9kOxUkPvF5
 HewRidlJKnX2xX6xfGxQik7MtvSsWNX8SpT0doEYQ/2hxDOoO+HsM8iSnfAVeN7r705lqIsE
 pHouayoW5xyd9gOwBxFBbGVkWCoXE/DadumM3X3bT4hUYRnQgCVqNbochG2pHsFFCOou8wkr
 /ut0x6dQJZFThk7VJTab/emzlWQu3kBmbssABOSeIEOKR7hoNpwNij8rv4rOMVSex/N8Tut0
 VrECxkvurifqoA4x9DFmKSYotr7COB5BEdbQTXW4O/uZynX92au26FaV+OMcWyPXW/44vzyN
 +5Pxu7yN+cL2ltPrsx9H/Bi0PtmtdfoorZbyCViHWnKNgr0Uuk6eiTXhsQW7/9D3L5UvweyS
 3mjwNgCNOXbIt7hHX4QOBEhMLaJ28YUrT+Ov/47F1qrtiZ48Y2OXVhWIxTR2jdWK6F4Md15z
 Oos5JwW5gi4hkZ4O9qKlHoPpW6NMmdGWL8uqZ8dGoOthw82jFBOJ5XBU3ek7JaKYtRKE08rP
 j7N2vWa3e4EmxuZfiphD2XJ0MpcmY8K5kJAwmgCEFLVyNDLseBmjhRe/AM+QhlR0hgagfl4P
 XJmNhMpKKjSrS1kgtNPAzKlFw1bX0fLpBS0kQdT0TeJChP0CirWMGQhOO3L4FgW8iRXeT0d9
 azBkDTpVjPjfcfQ2CouWBc79KS5F4Qsp1bPyJK9AsCIP5gmej650KWgUmxZ+RLoDPQ4iFDDu
 eQ3rv17brf2NHBMrqA2Y2VAOW/8lPxZyLR+fMxc
IronPort-HdrOrdr: A9a23:qIU0OaGrk2Bw3si4pLqExseALOsnbusQ8zAXPiBKIyC9vPb4qy
 nIpoV96feX4Ax9ZJhEo7y90ca7MBDhHPJOjrX5Xo3SODUOxlHYTr2KhLGKq1bd8kbFltK1u5
 0PT0DwZeeAa2SS9fyKhTVQC+xQuuVv7prY/ts2EE0dND2Duslbnn9ENjo=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 04 Jan 2023 16:39:53 +1030
Received: from agc.com.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30469VlC3124168
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Wed, 4 Jan 2023 17:09:41 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30469VlC3124168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1672812581; bh=Rm7lB51OAh8/bUal+PHA07ErAREdO4p/T6B65RokLls=;
        h=From:To:Cc:Subject:Date:From;
        b=m2eJvB1lKjtdXp4+jjSxyVxtQ4/BiNcYnlApLaVt6eAf/8q/jzurh/2CZfS2SknJ6
         yUFbISVpFAGhhrpgPphIulNEWbW5xlLS95e0IckwQ2t6scOWigpl3rIhg5MG1otNAM
         i6MZqUPuGv8/XYlqKntgnUllqkegseMKIl8KX8FbJGchfLDJ3OLyQMhesVLQb/vUth
         06UhCetDzFFphwW8It0dn4sn8eRxSrRIfsLeuZkXz/KK5vlv4hsWP+FI7rDKQ3Ve3x
         Yd2SJvhuHkuhx9/4C+3TDAGNpMtes4yhEHqJ1n+n8cpjBkX7oBO581khPnrFYqZXzB
         CHMl6IaKgw/XQ==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 0/2] hwmon: (it87) Set second Super-IO chip in configuration mode
Date:   Wed,  4 Jan 2023 17:09:24 +1100
Message-Id: <20230104060926.619686-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Wed, 04 Jan 2023 17:09:41 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On various Gigabyte AM4 boards (AB350, AX370), the second Super-IO chip
(IT8792E) needs to be in configuration mode before accessing the first
due to a bug in IT8792E which otherwise results in LPC bus access errors.
This needs to be done before accessing the first Super-IO chip since
the second chip may have been accessed prior to loading this driver.

The problem is also reported to affect IT8795E, which is used on X299 boards
and has the same chip ID as IT8792E (0x8733). It also appears to affect
systems with IT8790E, which is used on some Z97X-Gaming boards as well as
Z87X-OC.

---

Changes since v1:
 * Improved description for both patches
 * Renamed function from gigabyte_sio_force to it87_sio_force

Frank Crawford (2):
  Allow calling __superio_enter outside mux
  Set second Super-IO chip in configuration mode

 drivers/hwmon/it87.c | 61 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 4 deletions(-)

-- 
2.38.1

