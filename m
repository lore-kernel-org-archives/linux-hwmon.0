Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1900CC05027
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Jan 2023 04:02:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbjAZECy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Jan 2023 23:02:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjAZECx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Jan 2023 23:02:53 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6D7437ECA
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Jan 2023 20:02:50 -0800 (PST)
IronPort-SDR: FBiUMfC1NEJOmJbf78FmHcZiIOEOM1Ut54HIdbeTd4wNFfTaQ82oanIZS4gRAZGFhXoS0UbwuM
 wbBDsVmG9Xa2LhKzuD7hMACNMwFduUDqCmxWq48NF9cw9dBJW7HSPERzPdFqpALvHgpC0HqI2L
 qtQ/YykWk6wIpM6E3EsiDLL5S1qyrSY8nJOZx8pJoEJ+JP4Pyu5coja5YeiyUAJjTMrMHuMIpy
 6aFIY5Ex9cQVvmQl5ow47P9jZ72VaQxXGz4kzaS0baasKkgvgnHQW8fFYRWbiqMjvoHzUhKqbO
 2djpfcbuBWAovLlGalSi0skO
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2BFBACK+tFjjPQc8jxaHAEBAQEBAQcBARIBAQQEAQFJg?=
 =?us-ascii?q?UaCLYJglW2fPg8BDwEBRAQBAYUGAoUjJjgTAQIEAQEBAQMCAwEBAQEBAQMBA?=
 =?us-ascii?q?QYBAQEBAQEGBBQBAQEBQFIHC1IHC1gHB4FBC4FhEwsDBAglDYZWAgEDJwsBD?=
 =?us-ascii?q?QEBNwEPGThXBgESgn6DI6xjM4EBgggBAQaCYppngV4JgUCLYYEUgzd6Qz+BT?=
 =?us-ascii?q?oQPbosDmz4KgTl4gSUOTHqBDwIJAhGBLAMJAwcFSUADCxgNFjIKEyw1CwtKE?=
 =?us-ascii?q?BsaGweBBiooFQMEBAMCBhMDIAINKDEUBCkTDScmaQkCAyFfBQMDBCgtCT8HJ?=
 =?us-ascii?q?iQ8B1Y3BgIPHzcGAwkDAh9PcS8SEgUDCxUqRwQINgUGHDYSAggPEg8sRA5CN?=
 =?us-ascii?q?zQTBlwBKQsOEQNQRxluBIIRBikmnhxrB1k1ToEjkz8KsF2DfIFSnn1MgUSnZ?=
 =?us-ascii?q?pdNIINmnh6BGIQrAgoHFoF5gX5NHxmDIk8BAgEBAQ0BAgEBAwECAQEBCQEBA?=
 =?us-ascii?q?QGBM4xqGYITjDhhOwIHCwEBAwmMIwEB?=
IronPort-PHdr: A9a23:rPGi9RKC2ljLThFf9NmcuVEyDhhOgF28FgQU9oFhgKhHbaqk5ZikM
 UnCo/RhylbUDs3S8fkRje3Qvuj7XHAYp4yMtXcefdlNT0oLhclMzVMpCcLXBRGkfKyzPX4xF
 p0aBlRupy7TDA==
IronPort-Data: A9a23:jh9y/qMtam1dXGbvrR2RkcFynXyQoLVcMsEvi/4bfWQNrUorgjVTy
 WsXUD+EPPiJZTf9ctslPo3kp00BupeAzt9hSlBt+SA1H3xD88CZC4XJcxr6birIcsObEB07s
 Z8VOtSbBc1lFXW0SjWFa+i59yMgvU2rqhsQLMaeZ0idkCc9EH9JZSpLwrJ/2sgy6TSAK1vlV
 ena+qUzBXf8s9JKGjJMg068gEsHUMTa4Fv0aXRjDRzjlAa2e0g9VPrzF4noR5fLatU88tqBe
 gr25OrRElU1XvsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0o2HKJ0VKtZt9mGt+pN4
 /5NrazhcAU4YZfnqt8Bf0VZAggraMWq+JefSZS+mcaS01aAeGHl3PtpFk1wMIgFvOd7R2hTn
 RAaAG5VKErf3aTskPThFrUEascLdaEHOKsRoHhmzhnSF/85T5fZT+PH4MIe3Tt2j90m8fP2O
 5ZBOWszNk6ZC/FJEnc9Nbs9m86avUH+eD5Dsn2ngbA5xkGGmWSd15C2aIGFIIbbLSlPpW6cp
 2Tb7yH5HRQdMvSBxjeftHGhnOnCmWX8Qo16PLm58ON6qEeUy2cQTQANE122vZGRiEKzX8xWM
 UE84Tc1oO4580nDczXmd0Pg5STY5FtGC58KT7F88x2E1qvfpRqBCWlCRTlELtU73CMredA0/
 mW1tPjpHQw+ib+EFki2xIyIgW+zKAFAeAfuehQ4ZQcC5tDipqQ6gRTOUstvHcaJYjvdR2iYL
 9ei8nVWulkDsSIY/+DgpgCY2m7ESozhF1NsvF2PAApJ+ysjPOaYi5qUBU/zxMsowGyxdUiNu
 nUV8yR1xLpWVcnleMClZugSVIqu+uqFeALVhVN0d6TNGhzzozv5IdoVumE7fhs1dN0YcCPoa
 wnPoQxQopRUOT2jcMebgr5d6ex2kcAM9vy/DZg4i+aihbArKme6ENlGPxL44owUuBFEfVsDE
 Zmaa92wKn0RFL5qyjG7L89Ej+B3mH9nmTmMHcCgp/hC7VZ4TCDMIVviGAXTBt3VEIve8W05D
 v4FaJDTkE0POAEASnSHr9dLRbz1EZTLLcuu8JwNLL/rzvtOBHkuQ/7X3b47fYF595m5Zc+Wl
 kxRrnRwkQKl7UAr3C3WMhiPnpuzBMgjxZ/6VARwVWuVN48LPtv/t/tPJsNpFVTlncQ6pcNJo
 zA+U53oKpxypv7volzxtLHx895vcgqFnwWLM3b3aTQzZccwFQfT88DqeRHjsiQLE2y2uY03v
 uT4hA/cRJMCQSVkDdrXMazwlQro5idDxu8iDVHVJtRzeVn39NY4ISLGjsgxf5MGJyLcl2mT2
 AuhCBsFofXA/t0u+97TiKHa84qkSrMsHkdTE2TBw6yxMC3WojiqzYNaCbbadirUS23z4qnka
 OBIifDwdvQaxQ4Yv415Grdt7KQ/+9q2+eAAl10/QyuVYg3yWL16I3SA0c1ejYF3x+dU6VmsR
 0aC2thGIrHXasnrJ14mIlZ3ZOq0yqBGkzbf2v05PUHm6XIl57GAS0hTYUWBhSEBfrt4NIQpn
 bUotMIMsVftgBs2KZCNlClL+WOWIjoNVrhht51cCZKy0lgnzVRLYJr9DC7q4cjRNI8VaxJ1f
 GGZ1PjYmrBR5kveaH5tR3LD6upqg8hcsh590w5QLluErdPJm/sr0UAD6j8wVAlUkElK3r4hI
 GRtLEEpd6yC8y0z3podByX2R1sEXk3coBCtjUAVnXHYRA+0TmPMamY6PKCE4RlBoW5bezFa+
 pCeyXrkCGi1JpiohXRsB0M1+eb+SdFR9xHZnJz1FcqyGchoaDXotaaieG4Upka1Gsg2nkDG+
 7Vn8esYhXcX7sLMT3DX07Wn6Ik=
IronPort-HdrOrdr: A9a23:/Dnuiaxl91mbh9BkPVSNKrPw9r1zdoMgy1knxilNoHxuGPBwWf
 rOoB19726MtN5yMEtMpTnkAsW9qBznhP1ICOUqUotKGTOW3FdAT7sSi7cKvQeQeREWn9Q1vc
 xdmupFebrN5DNB7foSjjPXLz6ureP3iJxA/d2uqkuFVTsaF52I8T0JdzpzzXcGPzWv1PICZe
 Ch2vY=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 26 Jan 2023 14:32:46 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30Q42O5V1960730
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Thu, 26 Jan 2023 15:02:42 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30Q42O5V1960730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674705762; bh=y13tW2raThAmNNP5ikKI/08rRN0vvmnwjxeCltInTIA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=t83S66JtXa6jBgBtX9K0krC62mpq+qw/5zLahT7rVurwpIVLVHJ0GJYdf5ykkDy4n
         uBU/NtycVghxUSSN7Kpt6/xlvAqhvSXkkoNICr5tgiwjFHwDH9hHDoT0QijH8RBNby
         mtNQ8GzvaZ0EjIf8pEdnNZ9MAlj4sMMrmW6jysmnBfO3KU9yooeXCUtgKyejZ6BBX9
         WY5Y4Hlyt8+0a23yE16g/EQT80LQWMZKtad5K//dOxVYt95UyemVmUZKHSo6K7fwgS
         PgRZrvMK+wcManoBJgCpEbnzFkBOaxowhW32bXLIsHwId0zyRnCd3FhaH85b242sZu
         BO/N09LqQrrbg==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 2/7] hwmon: (it87) Disable configuration exit for certain chips
Date:   Thu, 26 Jan 2023 15:02:18 +1100
Message-Id: <20230126040223.986189-3-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126040223.986189-1-frank@crawford.emu.id.au>
References: <20230126040223.986189-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Thu, 26 Jan 2023 15:02:42 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

IT8790E and IT8792E/IT8795E have been identified as chips that can have
issues when disabling configuration mode.

Set to never exit configuration mode.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 7049e81f5af1..c5e46b94f0b8 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -2453,6 +2453,13 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 		break;
 	case IT8792E_DEVID:
 		sio_data->type = it8792;
+		/*
+		 * Disabling configuration mode on IT8792E can result in system
+		 * hang-ups and access failures to the Super-IO chip at the
+		 * second SIO address. Never exit configuration mode on this
+		 * chip to avoid the problem.
+		 */
+		doexit = false;
 		break;
 	case IT8771E_DEVID:
 		sio_data->type = it8771;
@@ -2474,6 +2481,7 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 		break;
 	case IT8790E_DEVID:
 		sio_data->type = it8790;
+		doexit = false;	/* See IT8792E comment above */
 		break;
 	case IT8603E_DEVID:
 	case IT8623E_DEVID:
-- 
2.39.1

