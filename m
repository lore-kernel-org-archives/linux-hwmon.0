Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CE4C3DA7D
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Jan 2023 06:51:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236807AbjACGv4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 Jan 2023 01:51:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236776AbjACGvz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Jan 2023 01:51:55 -0500
X-Greylist: delayed 304 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 02 Jan 2023 22:51:50 PST
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EFEA25F7F
        for <linux-hwmon@vger.kernel.org>; Mon,  2 Jan 2023 22:51:50 -0800 (PST)
IronPort-SDR: R8jY60ch4jtfGFHMW2Snq4VxPG1Ay1HkGBxgdRTNHUrzEQn8bn4FHARMKLD4NhNH5zFT79oNcF
 ybJQaYsSMXy3I9lxO2Lej9GaLzzGOtErswQV+AfqOlj/PYVH0sU+x7DYwhhuy1HmTYpc+Dg4Zy
 c+a8Wg/amXnDBt6Nr8mqLBVcHdGRt+Ib9OcFADzd6utf4MCTaVJc4+8lI9fwT5u59eVnKy9rlO
 YLByyt4S+yRU86dqt9Krd1QhQwZadVmRECrXTZIKnjec8e0DIONg2j9Mlg9MXE70QhpDYX4PbB
 CBvts8jNO61BxTqK8QTX9gBG
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2BeBwAozrNjjPQc8jxaHgEBCxIMSYNzgl+1Jw8BDwEBR?=
 =?us-ascii?q?AQBAYUFhRMmOBMBAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBAQYEFAEBAQFAU?=
 =?us-ascii?q?gcLUgcLWAcHgUELgWETCwMxDYZZNgENAQE3ASiBFQGDEIMjs1SBAYIIAQEGg?=
 =?us-ascii?q?mKaZoFeCYFAi2CBEoM3gT0/gU6ED26DfIcGmRoKgT19gScOTFcDCQMHBUlAA?=
 =?us-ascii?q?wsYDRYyChMtNRdLEBsaGweBCiooFQMEBAMCBhMDIAINKDEUBCkTDScmawkCA?=
 =?us-ascii?q?yJmAwMEKC0JQAcmJjwHVjcFAwIPHzcGAwkDAh9RcS8SEgUDCxUqRwQINgUGU?=
 =?us-ascii?q?hICCA8SDyxDDkI3NhMGXAEqCw4TA1BHGW8EggwKLyicBoEIgQ6BccQRg3iBU?=
 =?us-ascii?q?J52TIFEp2CXRiChdYEYhCgCCgcWgXmBfk0fGYMiTwECAQEBDQECAQEDAQIBA?=
 =?us-ascii?q?QEJAQEBAY4dGYITjDhhOwIHCwEBAwmJW4JIAQE?=
IronPort-PHdr: A9a23:8hPhwRaLbfsNmQ7Nqp49zxj/LTAZhN3EVzX9orItiq5VNK+59ovsO
 1bTo/hokRnIUcPS9qEMgvDd5qbnX2FI+pOdqDYYfZlLSxJAiN1DkQAsWpzaAET3fvK2MHxoR
 ZYQX1U8pyOwOhAKcPs=
IronPort-Data: A9a23:EYeyOaMKJIt3xPXvrR2SkcFynXyQoLVcMsEvi/4bfWQNrUohhmRUz
 GAaCGyOaPfZNmT0eY0lOYqxoRlXusfXy9QxSwU4pXs2H3kVpJaeDoWTchyobynDcsfIEhM54
 ZgQNYLKBc1lFXW0SjWFa+i59yMgvU2rqhsQLMaeZ0idkCc9EH9JZSpLwrJ/2sgy6TSAK1vlV
 ena+qUzBXf8s9JKGjJMg068gEsHUMTa4Fv0aXRjDRzjlAa2e0g9VPrzF4noR5fLatU88tqBe
 gr25OrRElU1XvsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0o2HKJ0VKtZt9mGt/8rx
 /YKk6W5cisCYr3NotgebT0BQhgraMWq+JefSZS+mcaS01aAeGHl3PtpFk1wMIgFvOd7R2hTn
 RAaAG5VKErf3aTskPThFrUEascLdaEHOKsRoHhmzhnSF/85T5fZT+PH4MIe3Tt2j90m8fP2O
 5FIN2Q1NkidC/FJEg0bS7h9w8zvv2ihbGRR9V2z/Jgq51GGmWSd15C2aIGFIIbbLSlPpW6cp
 2Tb7yH5HRQdMvSBxjeftHGhnOnCmWX8Qo16PLm58ON6qEeUy2cQTQANE122vZGRiEKzX8xWM
 UE84Tc1oO4580nDczXmd0Pg5STY5FtGC58KT7F88x2E1qvfpRqBCWlCRTlELtU73CMredA0/
 nDTkPCuIwVmi5G+FWKczIuXkxfraBFAeAfuehQ4ZQcC5tDipqQ6gRTOUstvHcaJYjvdR2+YL
 9ei8nNWulkDsSIY/+DgpgCY2m7ESozhF1NsvF2PAApJ+yskPOaYi5qUBU/zxMsowGyxdUiNu
 nUV8yR1xLpWVcnleMClZugSVIqu+uqFeALVhVN0d6TNGhzzozv5IdoVumE7fhs1dN0YcCPoa
 wnPoQxQopRUOT2jcMebgr5d6ex2kcAM9vy/DZg4i+aihbArKme6ENlGPxL44owUuBFEfVsDE
 Zmaa92wKn0RFL5qyjG7L89Ej+BxmHBinzmOGsunp/hC7VZ4TCDLIVviGAXVBt3VEIvf+W05D
 v4FaJDRkEUHOAEASnWLodVDRbz1EZTLLcuu8JwNLL/rzvtOBHkuQ/7X3b47fYF595m5Zc+Wl
 kxRrnRwkQKl7UAr3C3WMhiPnpuzBMgjxZ/6VARwVWuVN48LO97wtfdBJspnLNHKNoVLlJZJc
 hXMQO3Yatwnd9gN0211gUDVoNMweRK1qxiJOib5MjEzc4Q5F17C4Nb7cAz1+G8DCzfxtMd4q
 qD5jlHXRp8KRgJDCsfKaavxkAvo5iZBwL5/DxnSP91eWETw64w0eSb/uf8AJZ1eIxv02WrI3
 gmbNh4UuO3RrtJn69LOn62F8dukHrImTEpXFmXW95isMize8jbxyINMSr/YLzvHXXz6/7+uI
 +hQ0rf9PLsOgQ8S4YZ7Fr9qy4M45sfu/uEFll0/QimTM1nyU+FuOHiL28VLp5Zh/L4BtFvkQ
 F+L9/lbJa6NZpHvHmkREwx5PO6N4u5FyDDd4MM8LFj++CIqrqGMVl9fPkfQhSFQcOl1PYciz
 btzscIa8Vbk2BArLs3AhTpd6GqLNHBGXqA68JAWRob201J5xlZHaJ3aKyn3/JDWNYoUaxJ0f
 mfIifqQnalYy2rDb2E3SyrH091dspJS6hpE+0BTdV2Gl+3MiuIzwBAMoy88SR5Yz0sb3u8va
 HJnMVZ5efeH8zty35IRATjpQV0bQUfJvxatlx0SiGTFTkLuSnTCLSs2PuPL9V1AqzBQeT1S/
 be5zmf5UG+0I5mohXVuARJo+675UNh81gzeg8T7Tc6LKJ9rMzPqj5inaXcMtxa6U9g6g1fKp
 Lc28et9AUEh2fX8f0Hm51Gm6Ikt
IronPort-HdrOrdr: A9a23:1LCVCqn6aPV0AwEKEVnLICBwaDrpDfIC3DAbv31ZSRFFG/Fw9/
 rFoB3U737JYVEqKRYdcbLpAsS9qBbnmaKdjrNhXotKMDOIhILKFvAH0WKd+UyDJ8SWzIc0vp
 uIGJIfNDSfNzZHZUmW2njfLz9Z+qjjzEmxv5al855yd3AQV0i+1XYBNu5LencGPDV7OQ==
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 03 Jan 2023 17:16:44 +1030
Received: from agc.com.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 3036kRlL2641329
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Tue, 3 Jan 2023 17:46:38 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 3036kRlL2641329
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1672728399; bh=Bbwgq2hqU7ZXey8rvM0AUpl/mIlGyl3htk5ddBRu00c=;
        h=From:To:Cc:Subject:Date:From;
        b=H2JxwLhSUNGz94BPXL2x/fKs6QBLuQwQ6G+uExbx8BCJP6H0qhVHdubmMxFFGcKE+
         Qthtmbls+/Tbh1jkqtvxmM80qgYut85F/aDOpfhgCz9ueahpxD6wkwZlyTar7yAHWf
         loS4jr4qZyuwHMq4MMtthjv8NRc335Nwlp7mk0Ldkh6dtfzwC1ba88MhmCW2G3TvW6
         3btXFPa43wAygDfaAuEJ7+d5ivix0jEcHTt6bZkwRW6xK4F5ZYWxga6Uk0VwM1NLvF
         XsaWhB14ywHtddquk2JdYZgVxtScyW3XP30xXheKEqVqP87FTqWa+oB9uJGy0kb7xt
         XJNo6C5cu5c8w==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 0/2] hwmon: (it87) Set second Super-IO chip in configuration mode
Date:   Tue,  3 Jan 2023 17:46:10 +1100
Message-Id: <20230103064612.404401-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Tue, 03 Jan 2023 17:46:39 +1100 (AEDT)
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

Frank Crawford (2):
  Allow calling __superio_enter outside mux
  Set second Super-IO chip in configuration mode

 drivers/hwmon/it87.c | 71 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 67 insertions(+), 4 deletions(-)

-- 
2.38.1

