Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7704CC61D97
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Jan 2023 04:03:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjAZEDA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Jan 2023 23:03:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjAZEC7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Jan 2023 23:02:59 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 026D99776
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Jan 2023 20:02:57 -0800 (PST)
IronPort-SDR: JFGgLbK5uz9q7ZjaEzGHfy6uLDSxmyFo0TyIapjHcv6Pq5MzZA4rh4HK6vSfGx8Z1+fDY5WeqP
 oOM6Oyj3gs0smE+mkeYB/KXk7wYk/PV29qeqL2NX03DIpkt1CdoZOgRas1DC58G0+SFrR7ej+D
 ZnWcv4+40eMWH1nbOp7gXI0h96QkEOkAlmus0rhRjSWI0VV5fF6TaYHqjMVSSox/NfPG4muSEY
 HUsM20QM8L45FDj2l+VISmVb3C5O+OqhTCo3UsyMi2ebrE09/epP7svitH4p/i+eRvLR1ZgeoI
 85uoJd4g1pf3qCWTStrZvwfI
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2ApBgCK+tFjjPQc8jxaHgEBCxIMSYE7C4ItgmCVbZ1Ag?=
 =?us-ascii?q?X4PAQ8BAUQEAQGFBoUlJjYHDgECBAEBAQEDAgMBAQEBAQEDAQEGAQEBAQEBB?=
 =?us-ascii?q?gQUAQEBAUBSBwtSBwtYBweBQQuBYRMLAzENhlg2AQ0BATcBKIEVAYMQgyOtF?=
 =?us-ascii?q?oEBgggBAQaCYppngV4JgUCLYYEUgzeBPT+BToR9iwOBDJoyCoE5eIElDkx6g?=
 =?us-ascii?q?Q8CCQIRgSwDCQMHBUlAAwsYDRYyChMsNRZKEBsaGweBBiooFQMEBAMCBhMDI?=
 =?us-ascii?q?AINKDEUBCkTDScmaQkCAyFkAwMEKC0JPwcmJDwHVjcGAg8fNwYDCQMCH09xL?=
 =?us-ascii?q?xISBQMLFSpHBAg2BQZSEgIIDxIPLEQOQjc0EwZcASkLDhEDUEcZbgSCES8mn?=
 =?us-ascii?q?w4WQzaBJoEJOQKSc45XoWKDfIFSnn1MgUSCNaUxl00ggiygcIQrAgoHFoFoA?=
 =?us-ascii?q?YIOTR8ZO4JnTwECAQEBDQECAQEDAQIBAQEJAQEBAY4dGYITjDhhOwIHCwEBA?=
 =?us-ascii?q?wmMIwEB?=
IronPort-PHdr: A9a23:GioImRFKHO4fMJpTYaOsyp1GfhYY04WdBeZdwpAml6kIeb6q4JrlJ
 kCZ6PBwyl7FG4zGuLpNkeGDtafmVCQb5IqZ9moPdZtQWloEkZAYkwB6UpGMAEGpIKK1P35jT
 pZJXgY9rXqwaRc9JQ==
IronPort-Data: A9a23:Er7sj681RbcXOJvSVRsiDrUDtHiTJUtcMsCJ2f8bNWPcYEJGY0x3z
 2tNWG3VPv+MM2PxKYx1OYq3800HucfWmtUyGwBlrSk2FXwV+cGaCY+VcRn7Mn7CcpTPEhg24
 cxCN4CdJs45EVbR90ynWlTDhSAsjfvSGtIQKwJl1gRZH1IMpPIJ0Eo78wIBqtc0x4D/WWthg
 PuqyyHlEAbNNwNcawr41YrT8HuDg9yq0N8olgRWiSdj4TcyP1FMZH4uDfnZw0nQG+G4LcbmL
 wr394xVy0uCl/sb5nJJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwZG8P4whlkeydx
 /1fhazzEzcVB5TgnfZFfFofEnt7EKB/reqvzXiX6aR/zmXMcmf3hf50BV44OpcUvOtyHCdP+
 boRNVjhbDjd36TsnOj9ELkq3Jh/RCXoFNp3VnVIwyvQC/UOSorKXKvN/9Me0TItwMFCW//DD
 yYcQWYzNESRP0cUZz/7DroFheWCn0TieAZCqUC3pbsTw1rZ4ShYhe2F3N39IYTRFZ8Pzy50v
 Fnu+2X/HwFfNMOazjyt7H2hnKnMkDn9VYZUE6e3ntZugVuO1kQJDxAdVh6mur+/h1LWc9BTJ
 kgK8zAjhbMv70HtRd74NyBUu1ba5ltGB4AVSb1/sl3RjLHI6hqYDS4YVjFALtchsYk/WFTGy
 2Nlgfv7NQws6o2pcEux86XMgnD1OHIQAGI7MHpsoRQ+3/Hvp4Q6jxTqR9llEbKogtCdJd0W6
 27TxMTZr+tO5fPnx5lX7niC2Gn8+cGVJuIhzlyKBzj9tl0RiJuNPdTA1LTN0RpXBK+kJrVrl
 EMVl86T/Yji5rnXzHTVKAnhNJek+L6+NyDAgRZQFp0s7FyQF5OLI9gVum0kYR05d5xYJXnyf
 EbPuAgX+IdcPT2haqoxap/Z5yUWIUrISYiNuhP8NIEmjn1NmOivpn8GWKJo9zqx+HXAaIlmU
 XthTe6iDGwBFYNsxyesSuEW3NcDn35hmT2MHMyhkEz3itJygUJ5r59baTNiichnscu5TPn9q
 Yc32zaikUoECbamMkE7D6ZOfQ5TdRDX+qwaW+QMLrXTeFA3cI3QI+PJzvsgfZBohaJYio/1E
 oKVBCdlJK7ErSSfc223hoVLNOuHsWBX8StlYUTB/D+AhxAeXGpYxPhCJ8BrLeh/qoSOD5dcF
 pE4RilJOdwXIhyvxtjXRcOVQFVKeEv5iASQETCiZTRjLZdsSxaQqo3vZALw+i4UAmy6sNZ4o
 rHm3x6CGcgPQAFrDcD3bvOzzgrv4iJEwbktABXFcotJZUHh0Il2MCiv3PU5FME7L0mRzDWty
 FfECBgVkuDBvosp/YSbnquDtYqoTbdzExMCTWnW5Lq7LwfA+W+nzdMSWeqEZ2mNBmju8bqsY
 v9Zifz5LbsGkBBDrtMkQbpsyKs/4frppqNbl1o7RiySNAv0VL45eyuIx8hCsKFJ14R1gwruV
 xLd4MReNJWIJNjhTgwbKj0lWeLfh/sarSaDv/06LXLz6DJz4LfaA15ZOAOBiXIBIbZ4bNElz
 OMmtJJE4gCzkEBxYNyHkjsS/H6FMXIHSalhu5QHRo7nzAM2kwkQbZvZAy7wwZeOd9QVbBZwe
 2bP2/WciuQO3FfGfloyCWPJg7hXi6MOjxYWnlUMEEvYyNPKi8g+0ABV7TlqHB9eyQ9K0rwvN
 2U3ZVd5I76Co2VhiMRZBDr+RVkEXkHDvxahjgFVyCvCU0C0V2eLMHUyOKCG+0Vf+n8FJmpX+
 7SRyWDEVzf2fZivgXFrABU69KLuHY5r6wnPuMG7BMDZTZM0Vjy00KahaF0BpwbjHc5s1lbMo
 vNn/bgsZKD2XcLKT3bX12VHOWwsdS25
IronPort-HdrOrdr: A9a23:fx/pda4J8CI4mk9xzgPXwObXdLJyesId70hD6qkQc3ZomwKj9v
 xG+85rsiMd6l4qNU3I/OrtBEDuewK+yXcY2+Ys1NSZLW3bURWTXeNfBOLZqlWKJ8SUzI5gPM
 lbHZSXh7DLfD5HZL7BkWyF+s4bsaO6Gb6T9JzjJqhWPHhXg3AJ1XYANjqm
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 26 Jan 2023 14:32:56 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30Q42O5T1960730
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Thu, 26 Jan 2023 15:02:33 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30Q42O5T1960730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674705754; bh=2lYyf6P6fOmVkga72doF9LSvkK3IZqHyvhdMrb+TDfA=;
        h=From:To:Cc:Subject:Date:From;
        b=Bg1T8ZnuLDWq5CNzD+4ut45epvKh/FkHpKFQHkRgTPvKTq8UPcpaMsDXSL2V0YUW8
         ZlIyBztsdo2rjj43mujcjGqyny7B0z/6Xg48J6WdJKP0FGxkBx3Ll+W0LOylSZXWtM
         PHjmfgdB0L94pJjOrJYSO8mP1/6FbXluQOhfo5JCRyS1LoXJuFFDDpXHWZZ4E3APRF
         emBpjJNxKg1YHsIVwOMw9pmEkzPae5MsSwFgsWkt1XP50JbkmVTVqpXYirzslwY4LW
         EYxMvm0jkPeDTTORkpxQJqWsPafRTEwYwmUaM9ZtVp4NHMSoDYDCcjBldiHRTkz8o2
         vxyUviWip1jgg==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 0/7] hwmon: (it87) Complete handling multi-chip configuration
Date:   Thu, 26 Jan 2023 15:02:16 +1100
Message-Id: <20230126040223.986189-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Thu, 26 Jan 2023 15:02:34 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Further support of multiple chips on a motherboard to disable
exiting configuration mode, including updating existing chips and adding
new chips that match.

Allow setting multiple chip IDs for testing, and correct listed chip
names andides, when required.

Update the system documentation.

---

Frank Crawford (7):
  Allow disabling exiting of configuration mode
  Disable configuration exit for certain chips
  List full chip model name
  Add chip_id in some info message
  Allow multiple chip IDs for force_id
  Add new chipset IT87952E
  Updated documentation for recent updates to it87

 Documentation/hwmon/it87.rst |  47 ++++++++++++--
 drivers/hwmon/it87.c         | 117 +++++++++++++++++++++++------------
 2 files changed, 120 insertions(+), 44 deletions(-)

-- 
2.39.1

