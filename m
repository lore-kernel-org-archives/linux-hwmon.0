Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0755C38142
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Jan 2023 04:41:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbjA0Elm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Jan 2023 23:41:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjA0Ell (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Jan 2023 23:41:41 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C6BDE39B9E
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Jan 2023 20:41:38 -0800 (PST)
IronPort-SDR: sqfaxt86URUSktegvZ/R9mSNM2YO2uCLnv3XnzFzvJpRnHDbDU0mPfUd/RD3knumMe3nfDgo8v
 7Tt6g0w547qmpS+7H480fClWPFm8Xl1q2tt8N3DoNTrbryYxSgWw0eVN51oXYi7Myuack4otQo
 uDHYS6VfpnxBCJBqih/Wrlz14Xjw485R+IsSpqrQzWfk7wiDvLZZ0yY8s1MSfWMbVg/2IqWi00
 lRcWe103DyoGswHvzswe7biVbHukB54xb21S8IwYZ2VDMhZ0e60vyLmtPDarl3TQ3cfrbYqsS8
 UlVi7OCgEYGgnOGTnkhFeRO/
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2A9BgCKVdNj//Qc8jxaHgEBCxIMSYE7C4ItgmCVbZ1Ag?=
 =?us-ascii?q?X4PAQ8BAUQEAQGFB4UlJjQJDgECBAEBAQEDAgMBAQEBAQEDAQEGAQEBAQEBB?=
 =?us-ascii?q?gSBKgcLUgcLWAcHgUELgWETCwMxDYZYNgENAQE3ASiBFQGDEIMjrByBAYIIA?=
 =?us-ascii?q?QEGgmKaZ4FeCYFAi2GBFIM3gT0/gU6EfYsDgQyaUgqBOXiBJQ5MeoEPAgkCE?=
 =?us-ascii?q?XRZAwkDBwVJQAMLGA0WMgoTLDUWShAbGhsHgQYqKBUDBAQDAgYTAyICDSgxF?=
 =?us-ascii?q?AQpEw0nJmkJAgMiYgMDBCgtCT8HJiQ8B1Y3BgIPHzcGAwkDAh9PcS8SEgUDC?=
 =?us-ascii?q?xUqRwQINgUGUhICCA8SDyxEDkI3NBMGXAEpCw4RA1BHGW4EghEvJp8rFkM2g?=
 =?us-ascii?q?SaBCQ8qApJzjlehYoN8gVKefUyBRII1pTGXTSCCLKBwhCsCCgcWgWKCFU0fG?=
 =?us-ascii?q?TuCZ08BAgEBAQ0BAgEBAwECAQEBCQEBAQGOHYIskUthOwIHCwEBAwmMIwEB?=
IronPort-PHdr: A9a23:d9Aj+xOG43L4cbvMkkUl6nczWUAX0o4cdiYf64Y8zblUe7ut+I7ue
 kHa+LNsgBnAQNaT4uhP3uzRta2oQmkc+dCbvXUFbJEJVgdQh8kaxV5/CceJW0Gnc664Nn5oF
 84bDA1u9CnkWXU=
IronPort-Data: A9a23:1CuYhq3Wn5xGzWsro/bD5fd3kn2cJEfYwER7XKvMYLTBsI5bp2YAy
 WoYXjuCPKyKNmLyf9FwYYi39xkC6JeBztRqHAJsqypgRSkX8JDOVYmTdB6oNHnJJJGeR0475
 pkVNITKc50dQy6HrH9BEJC4/SEmj/3gqpkQqQLgEnosLeOxYH550XqPo8Zg3sgwx4LR7zql4
 bsemeWGULOY82cc3lw8u/rrRCxH5JweiBtA1rDpTa0jUPf2zhH5PbpHTU2DByKQrrp8QoZWc
 93+IISRpQs1yfuM5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2Pc0MS9qZzu1c99Z8
 vZTiZ3qDgwQEobOnvw6djMAPTphIvgTkFPHCSDXXc27xUzaaD3n2fxxAkYsMcsV//sxAG0I/
 OFwxDIlMEjF3b7shujrDLMw2qzPL+GyVG8bkn96xDfaJf08SI/NRL/Go9JdwXExioZHAJ4yY
 uJFNWI+MUmfOUYn1lE/Vq88xeWyiFPFUB5CjXSHgKQMxlWO9VkkuFTqGIGNIYzQH5Q9clyjj
 mbH+XnpRxEFMduZ4SSK/2jqheLVmy7/HoUIG9WQ8v9snU273GseAx5TSED9p/Sl4ma8V99bN
 UUO9wI1sLM/skesS7HAswaQ/ibB5EJGHoAAVrdmtEeW1qPI4g3fGnALT3hKb9lgvdJeqSEWO
 kGhpfD3OT0197asZVmf8K+ziBnqFzMKMjpXDcMbdjct797mqYA1qxvASNd/DaK45uEZ/xmtk
 1hmSwBg2t0uYd43O7aTuAuc0231+vAlWiZsu1yNBjr7hu9sTNT9D7FE/2Q3+t5pEe51pHG6r
 XQCltn2AAsmV8nVzERhrM0rEa7h3PGYLD2UvldrEoJJythA0yD7ONoMunQkdAIzbppCYiPgf
 E7Y/x9J654VN3yvK6ZqC25QNyjI5fS8fTgGfqqPBjarXnSWXFXZlByCnWbKgwjQfLEEyMnS+
 f6zKK5A90oyB6V91yaRTOwAy7ItzS1W7TqNGsykkkv3iuLFPCL9pVI53L2mM7BRAESs/li9z
 jqjH5Hbo/mieLehOXCMqd57wa4icClgX8ueRzNrmh6reVI9SDt7Wpc9MJs9Y4MtnqJJm/3O8
 23VZ6Or4ASXuJAGQC3UAk1ehETHBM4i9y1kZ3FyZD5FGRELOO6S0UvWTLNvFZFPyQCp5aUco
 yAtd5rSD/JRZC7A/jhBP5DxoJY7JEagnwuRMS2/bH4yeoMmRgCP88K9Jlnj8ywHDyyWs8oio
 uT+iVmBGcBfFllvXJTMdfai71KtpnxDyuh8aEv/JIUBckvb79k4IiP8ufY7PsUQJEiR3TCdz
 QuXX0sVqLCV8Y84+dXEn46eqIKtH7csF0ZWBTCLv72sPDbU+XCvh4JFTaCJcXbUSTqsqqmlY
 OxUydD6MeEGxQgV6dAkSeo6kK9nvonhvb5XyAhgDU7nVVXzB+MyOGSC0OlOqrZJmO1Ttzy2b
 UTTqNNUDqrYasrqHWkYKBchcuneh+ofnSPf7KppLUj3uH138b6AXRkANhWAknYGfrF0LJhjy
 v0op8AR8QD5hx83dNeKyClJrjzeInsFWqQhl5cbHI6y1FVxkAkYPc2BB3+k+oyLZvVNLlIuf
 G2eip3CsLIAlEDMRGViR3HC0N1UiYkKpB0XnkQJIE6Em4SZi/Jrjgdd9y87ElZcwhldiLghZ
 DAubREvYP/eum002I5YQ2mwGgoHGAWW+wr6zF5PnXCAFxukUWnELWscP+eR/RlHrDgGJmIHr
 eyVmDT/TDLnXMDtxS9uC0RrnPqyH9V++zrLlN2jA8nYTYIxZiDog/HyaGcFw/c97RjdWKEaS
 TFWwdtN
IronPort-HdrOrdr: A9a23:Yz78ca5gnUBIb+JL2wPXwObXdLJyesId70hD6qkQc3ZomwKj9v
 xG+85rsiMd6l4qNU3I/OrtBEDuewK+yXcY2+Ys1NSZLW3bURWTXeNfBOLZqlWKJ8SUzI5gPM
 lbHZSXh7DLfD5HZL7BkWyF+s4bsaO6Gb6T9JzjJqhWPHhXg3AJ1XYANjqm
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 27 Jan 2023 15:11:35 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30R4fIgd2462776
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Fri, 27 Jan 2023 15:41:27 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30R4fIgd2462776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674794487; bh=sWAKrgfog0p4luHTT552dx92uNPbyAcM5oSTk9+0NPQ=;
        h=From:To:Cc:Subject:Date:From;
        b=IsfLkj48/dohBrl4bFduPLKMkxGa5x/8RnYk4Lcmd2LYUx2qfC+PS8tACBclh0jTj
         CC6uYGmmy/RqDqaxOSyMYt9IyLz8axcz6b79Rgc1H5gfgemQC5fd5PX18XTPKm8Cnx
         kWWIhx5tRVo1gyo7jdXUcFJ586Egg+wlFJrroRqXOk9z1GCtFKN4b9UK9hnf0xcs/b
         7PtFJLlfv2Jo5ATBk7zQ4sS3wRFXvSwSonSR9ie7mUdo2BFyaGO2ELNOOAe98pfYVo
         MVu4ayGWFTHajMeFy7LmGAkNxGiHdlxMG8J4x1BL04elkDyDcN60vUiieIxIPP6uKl
         VsOcmkK2NmidQ==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 0/7] hwmon: (it87) Complete handling multi-chip configuration
Date:   Fri, 27 Jan 2023 15:41:09 +1100
Message-Id: <20230127044116.1257799-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Fri, 27 Jan 2023 15:41:27 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Further support of multiple chips on a motherboard to disable
exiting configuration mode, including updating existing chips and adding
new chips that match.

Allow setting multiple chip IDs for testing, and correct listed chip
names and IDs, when required.

Update the system documentation.

---

Changes since v1:
 * Convert to use feature flag and related macros rather than a separate
   field, as suggested in review.
 * Reverse sense of flag in superio_exit to simplify feature macro.
 * Improved chip description following review.

Frank Crawford (7):
  Allow disabling exiting of configuration mode
  Disable configuration exit for certain chips
  List full chip model name
  Add chip_id in some info message
  Allow multiple chip IDs for force_id
  Add new chipset IT87952E
  Updated documentation for recent updates to it87

 Documentation/hwmon/it87.rst |  47 ++++++++++++--
 drivers/hwmon/it87.c         | 117 ++++++++++++++++++++++-------------
 2 files changed, 116 insertions(+), 48 deletions(-)

-- 
2.39.1

