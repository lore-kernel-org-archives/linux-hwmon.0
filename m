Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DDCC27C76
	for <linux-hwmon@archiver.kernel.org>; Sat, 21 Jan 2023 08:58:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjAUI6Z (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 21 Jan 2023 03:58:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbjAUI6Y (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 21 Jan 2023 03:58:24 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9857B1C315
        for <linux-hwmon@vger.kernel.org>; Sat, 21 Jan 2023 00:58:19 -0800 (PST)
IronPort-SDR: 9RzF3sKPeTm8U6Q2m4j8xgFZC77qCRdM7aPOTjneu//XG6XARsTd8WV6/2Io3oCIXB6jTYgDH9
 kYYJdHBfO28/1PwmOWvbLtBiAggl9BaDTtFrmzQfQdny3cdOaqixjTJknDBfCpEr/ODv9kzCml
 wmgoxfvZ2iQK7vPSxNYHPKaYMixtJBYd8yryrJU28sU9JE1KoIQqvv44t7Mqvsd49995W957Pe
 5ek/3GljcZIHtTTXThNdOj7q6BP4Vact543N93a1P8xMVUdUNWUZj9yOb3Kw/Y8hcaBCR1ek4p
 w7u0oguxPVLVa0JEBXL+5BNp
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2AVCQDLp8tjjPQc8jxaHgEBCxIMSYE7C4Itgl+zLoF+D?=
 =?us-ascii?q?wEPAQFEBAEBhQaFIiY2Bw4BAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBAQYEF?=
 =?us-ascii?q?AEBAQFAGAE5BwtSBwtYBweBQQuBYRMLAzENhlk2AQ0BATcBKIEVAYMQgyOrW?=
 =?us-ascii?q?IEBgggBAQaCYppngV4JgUCLXoESgzeBPT+BToR9iwObFAqBO3yBJw5MeoESA?=
 =?us-ascii?q?gkCEoEgAwkDBwVJQAMLGA0WMgoTLTUWSisaGweBCCooFQMEBAMCBhMDIAINK?=
 =?us-ascii?q?DEUBCkTDScmaQkCAyJkAwMEKC0JPwcmJjwHVjcGAg8fNwYDCQMCH1FxLxISB?=
 =?us-ascii?q?QMLFSpHBAg2BQZSEgIIDxIPLEMOQjc0EwZcASkLDhEDUEcZbgSCDAovKJ8bg?=
 =?us-ascii?q?Q7GEoN6gVKefUyBRIIipUSXSyCjG4QrAgoHFoFpCIIGTR8ZgyJPAQIBAQENA?=
 =?us-ascii?q?QIBAQMBAgEBAQkBAQEBjh0ZghOMOGE7AgcLAQEDCYwjAQE?=
IronPort-PHdr: A9a23:CrgJRx0a9GNXEi3CsmDPn1BlVkEcU/3cNA8J8dwskbtRfKO589LvO
 VGZ5PkrhUKaFYzB4KdCjOzb+7vlRXRG+5uEt2wPNZ1UAhEJhZ9EwAUpDJyJVRKrfqe4PScwR
 ZwQX1Q9oBmG
IronPort-Data: A9a23:tJVjl64DMHtHwXSlEvzz3AxRtAHBchMFZxGqfqrLsTDasY5as4F+v
 mcYXGDUOvffYWaje99waonkoB9Xu8PTz4BnHgU/qXpkFn5EpJaYWIvIIxmhZy2YJJaZFRM5v
 59EMIKddcxsQHH1q0b2ONANj1ElhfnSHOaU5M0om8xVbVU5IMv0oUs7w4bVuqYx3Z7hRVnlV
 era+6UzAnf8s9JJGjt8B5yr+EsHUMva4Fv0jnRmDRyclAK2e9E9VfrzFInpR5fKatA88t2SG
 44v+IqEElbxpH/BPD8EfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1hUp/0120c95NJ
 Nplt7etUhkJBPXwm98ieCgfEiwvIK550eqSSZS/mZT7I0zueXrw2LNlFkgpM4oC9qB6BHwI9
 PBeIS1lghKr2brwmu7hDLM8wJ5/cKEHP6tG0p1k5T/DBPAlaZvZSrrE4sVUmjo1m4ZPEbDXe
 qL1bBIzMEyeOUQfYQt/5JQWxeaYgnrPKwZhsAyPu7c3oDnzyTRez+24WDbSUofSHpUPxBfwS
 nj912D4BAwKcdyAzD2D2myji/WJni7hXo8WUrqi+ZZChFyV23w7EhobXlj+vOL/jEOiM/pdJ
 0EQ5CM0oIAp6VemCNL6WnWFTGWs4EZZAYYKVrdqrVvRluzP/w+FB2NCUiZOaZots8pwTCFCO
 kK1c83BBxdyq6O1cyqh9YyrhgL1OCVEMGw9THpRJeca2OXLrIY2hxPJa99sFq+pk9H4cQ0cJ
 RjU9EDSYJ1N0KY2O7WHEUPvxmn39seQEmbZ8i2OAzv/tlsnDGKwT9bwgWU3+8qsO66wczFtV
 lA/isSY4fFm4XqlznTVGI3h8JmP6unNCzrBnV4nIJAl+i/FxpJOVd4IpWsifgIzYoNeJWOve
 1PapQJaooNLM3rsZqhyJYusYyjL8UQCPYi5Phw3RoAVCnSUSONh1Hs2DaJ39zqz+HXAaYllZ
 f+mnT+EVB7285hPwjusXPs62rQ23C04zm67bcmlkEj9iuvCPiHPFO9t3L6yggYRsvrsTOL9r
 Ys3Cid2408POAEDSnOIq99MfQBiwYYTW8ir95I/mhG/zvpOQzl6W6WLkNvNiqR5h6sdl+HU8
 2u7V1Mw9bYMrSOvFOl+UVg6MOmHdcgl8hoG0dkEYQ7AN44LPd/xsM/ytvIfIdEayQCU5aUuF
 6JVKpzdWZyiiF3volwgUHU0l6Q6HDzDuO5EF3DNjOEXc8EySgrX1MXjewezpiACAjDu5Zk1u
 bS/2ATBTdwOQhkkDcqQYe/2lwG9un0UmeRTWUrUI4ANJxyyodk2enL83q0tPsUBCRTf3T/Eh
 QyYNhcvo7WfqYEC74ibjK+JmI6lDu9iExcIBGLc97u3a3XX8zP7k49NWeqFZx7HU2bw9Pnwb
 OlZ1aisYvYdlUlEtJBwVbtu0OQ/653muuYCnAhjGXzKaXWtC69heyfZhJce5/EcmLIA4Fm4Q
 EOC/NVeKI6lAsK9HQ5DPhchY8SCyeoQxGvY48M1F0OmtiV5y6XWA0xdMi6FhDFZMLYoYpgux
 v0suZBK5gGy1kgqP9KBgnwG/miANCZbAa8mqopcC5XilQQs0F0EbJnBTC76ppiSMo0ePk4vK
 z6SpazDm7UFmBWbLStiSSmT0LoPn4kKtTBL0EQGeQaDlO3FsflrjhdfxitmHA1awyJO3/93J
 mU2ZVZ+Ir+D/mk0icUfDXqgHRpNWE+Q9kDrkAFbyjWcFRXyEzadaTdhZaCW4EkF8mkaYiBU/
 feTz2OjWCuzJJP92S47WEhErf3/TIUvqVScyZH7TpqIT8sgfD7ooq6yfm5U+RHpNsVg1kTIq
 N5j8Pt0daCmZzUbpLc2CtfG2LkdIPxeyLeunR28EHs1IFzh
IronPort-HdrOrdr: A9a23:MWZMya567hfOS6uBfgPXwObXdLJyesId70hD6qkQc3ZomwKj9v
 xG+85rsiMd6l4qNU3I/OrtBEDuewK+yXcY2+Ys1NSZLW3bURWTXeNfBOLZqlWKJ8SUzI5gPM
 lbHZSXh7DLfD5HZL7BkWyF+s4bsaO6Gb6T9JzjJqhWPHhXg3AJ1XYANjqm
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 21 Jan 2023 19:28:15 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30L8vxu22985116
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 21 Jan 2023 19:58:08 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30L8vxu22985116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674291489; bh=hLu/RPxJ7wfYGzMx1tQC52PjT757JQk6MZSfsD/Xkc0=;
        h=From:To:Cc:Subject:Date:From;
        b=OiEH908yGCfVrruwu56Zhpsl3SMM5iyKSBX+ckgmP6dciV18fWpZJ1Fi+zPv5AlPi
         9pNYTMIbpLGkW+w5w5Jrgql+HgoqAdkL42LOaWhyA2Ou6dhJkvX5zzFg4e8qZk4A8j
         Cq2nTIWP353W1E4w8r4se/nvANpxfo8RzCR44fM+CthJP4k1B+6eL6sIrRSb0u1hgl
         vx5P7zI5Q5WfPbb9BV0zQA76kXPLdipAKVoH7Wj/Te3+3yKmhXLrXVPdDA+uBb+UGZ
         0OuXDh52N6W7mph6FWpnItJ8KvNr+hsP39qF6nkInShqLwnqixUWv7KGSEVWHv4ckN
         gl0lcXw7fDELA==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 0/2] hwmon: (it87) Minor cleanups for future development
Date:   Sat, 21 Jan 2023 19:57:52 +1100
Message-Id: <20230121085754.1693336-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 21 Jan 2023 19:58:09 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Minor cleanups to make future management easier by
- grouping together all the MODULE_PARM definitions, and
- log a DRIVER_VERSION to distinguish the in-tree version from any
  development versions.

---

Frank Crawford (2):
  Group all related MODULE_PARM definitions together
  Added driver version to distinguish from dev version

 drivers/hwmon/it87.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

-- 
2.39.0

