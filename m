Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C1DC61D9D
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Jan 2023 04:02:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjAZEC5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Jan 2023 23:02:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbjAZECz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Jan 2023 23:02:55 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8E88D2D72
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Jan 2023 20:02:53 -0800 (PST)
IronPort-SDR: ldxoz8I1hk9ezsQU93YclsKp240Y6Any6P0e3WpZht2X2pESl8uYDhvM3/WWoWNSLPF1umgQRw
 NwU8msGtf2dDCUrnOYB/IiQasRvBRLrTY3UYdWKVxjL/xye+Tk3Zg0JuWe4v7vGE9OsHV+zQp7
 UXgsumIE3BtPNJgJ9xsZzsOBhOaSkm16pkju7Whj9qkysP+vOXNKdgWFBhnoBdlWFyJ9FZcj2E
 RteIscJpnyIFbBCKlrspNYJ3rI0JTjqqzPlJnErR+8r/zyR+i/TYfSvoGN6LZjPWo5y3QwRIRb
 FtL9xZnUIc0VdmoW8d59s3ot
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2C4AACK+tFjjPQc8jxaHQEBAQEJARIBBQUBSYE0BgELA?=
 =?us-ascii?q?YIsgmCzLYF+DwEPAQFEBAEBhQYChSMmNgcOAQIEAQEBAQMCAwEBAQEBAQMBA?=
 =?us-ascii?q?QYBAQEBAQEGBBQBAQEBQFIHC1IHC1gHB4FBC4FhEwsDMQ2GVgIBAzIBDQEBN?=
 =?us-ascii?q?wEPGThXBgESgn6DI60WgQGCCAEBBoJimmeBXgmBQAGLYIEUgzd6Qz+BToR9i?=
 =?us-ascii?q?wObPgqBOXiBJQ5MeoEPAgkCEYEsAwkDBwVJQAMLGA0WMgoTLDULC0oQGxobB?=
 =?us-ascii?q?4EGKigVAwQEAwIGEwMgAg0oMRQEKRMNJyZpCQIDIV8FAwMEKC0JPwcmJDwHV?=
 =?us-ascii?q?jcGAg8fNwYDCQMCH09xLxISBQMLFSpHBAg2BQYcNhICCA8SDyxEDkI3NBMGX?=
 =?us-ascii?q?AEpCw4RA1BHGW4EghEGKSaeFAhygQ6BJ8Rwg3yBUp59TIFEp2YtlyAgoxyEK?=
 =?us-ascii?q?wIKBxaBaQaCCE0fGYMiTwECAQEBDQECAQEDAQIBAQEJAQEBAY4dGYITjDhhO?=
 =?us-ascii?q?wIHCwEBAwmMIwEB?=
IronPort-PHdr: A9a23:fdi85h0haJsooluysmDPn1BlVkEcU/3cNA8J8dwskbtRfKO589LvO
 VGZ5PkrhUKaFYzB4KdCjOzb+7vlRXRG+5uEt2wPNZ1UAhEJhZ9EwAUpDJyJVRKrfqe4PScwR
 ZwQX1Q9oBmG
IronPort-Data: A9a23:VRRacKpPUHHAPat5FfsxM9I27U9eBmIsYxIvgKrLsJaIsI4StFCzt
 garIBmOaPmCYzPzKd8lPITlpB8GsMPVztNhGQtkpS42F34Qo8SdX4SXIhn9ZnqeJ8OeQUw9v
 8lCZNLJd5llFHXQrE71G7Ww9nMUOYOgH+qkUrSYUsxSqa6IbA971HqPTsZg2tYAbeCRWl/L4
 ZWoyyHmEAfNNwRcawr41orawP9RlKSq0N8nlgRWicBj5DcyQFFIZH63DfjZw0rQGuG4LMbjL
 wrw5O3RElfiwvsYIojNfoAX06E9auW60QCm0hK6UkU56/RIjnRaPq0TbJLwZarL4tmEt4gZ9
 TlDiXC/YSQXJO7iv9wmbx1VLix5baF31fjBeWfq5KR/z2WeG5ft6/9vEFpwNpcR5ehwG20I+
 PkFbjEBKBme7w606OzjDLMw3IJ5fI+xYN93VnJIlFk1Cd4oW5nFQI3B/9ZH0jAqioZDGOuYZ
 sZfYCcHgBHoP0EXagZLUshv9AuurifucAFy+XGzmbUIxm70kAda7JTrNNWAL7RmQu0Oxh3I/
 DiXl4jjOTkeNdqC2X+F7XergMfRki7hHoEfDru18rhtmlL77mgSDgAGfUG8rPK6z1OlHdRSN
 yQ8+CYjqbY77kGDVcTmUluzp3vsg/IHc4QIVrdmskTXmu+Ov1rfHXQNUj9KLsA+u85wTjsvk
 FaU9z/0OdBxmJ6rUzGz0Y+vkTe/BCUSfWMzSGgCFRRQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2QM4W2ex7YSkjifjTwLzXv96/jt2SFV5qv1m/snaNt14gPtb9OeRE/HCBtZ59wJClok6pl
 UVsdyK21/ECC5yc/MBmaL9VROnBCxqtFjDDyWVoAoUhvwuk/3O4Fb28DRkgfAIzbpxBI2+sO
 hOP/xhN7YNSNz22daB2JYm2DoIj0MAM9OgJtNiIMrKigbArL2drGR2CgmbKgQjQfLAEy/1XB
 HtiWZ/E4YwmIapm1iGqYOwWzKUmwCszrUuKG8+nkUv+jeDBPC7OIVvgDLdoRr5ghE9jiFuIm
 +uzy+PQmn2zrcWkPXKOqtZDRbz0BSVrW8muwyCoSgJzClE+QzF7Ua65LUIJZ5Rq16VTiurS+
 HyhMnK0O3Kh7UAr3T6iMyg5AI4DqL4j9RrXywRwZAj0s5XiCK7zhJoim2wfIuR3r7AznKYqJ
 xTHEu3Zaslypv3802x1RfHAQEZKLnxHXCqCYHioZiYRZZllS1Cb89PoZFK/piIUBzW5stEy5
 bCly0XaTdwKWl06XsrRbfuuyXK3vGQcwbwtBRKReYYMI0i8opJ3LyHRj+MsJ59eIxv0xgyci
 1ScDyAH9LvErIIC+dXUgbyJ8tWyGOxkE0sEQ2TWtO7kNSTT8me575VHVeKEIWLUWG/uofXwb
 v9c0P/7KvFBkVNX9YtwVb92lPps69zqrr5c7wJlAHSSMQvxU+o7fSbd0JAW5KNXx7JftQ+nY
 W61+4FXaeeTJcfoMF8NPw57PO6N4vEjnGWA5/oCPxSo7SB6y7OLTEFOMkTekydaNrZ0bt8oz
 Op96s4b7wuz1kgjPtqc1HsG/WWQNToLSaw4uJYADMnmjxdty10EaIGFUn3655SGatNtNEg2I
 2bK2/Cb3u8DmRHPIygpCHzA/etBnpBQ6hpE+181IQjbkNTyma5l1RJcxj07UwBJw0gVyOl0I
 GVqaRF4KPnc5Ttun8QfDWmgFxsaXk/HogmrlwFMzj2cFRX0EHfRJXE8MqCR5E8YtWlbe35S4
 ejAmmriVD/reuD33zczABA68aW6FoMurQCSytq6G8mlHoUhZWa3iKGZYztaohTqNso9mUnbq
 LQ45+13c6D6a3IdrqBT51N2DljMpM1o/FB/fMw=
IronPort-HdrOrdr: A9a23:k8E2eqG3lc9SoJY1pLqEMseALOsnbusQ8zAXPiBKIyC9vPb4qy
 nIpoVj6feX4Ax9ZJhEo7y90ca7MBDhHPJOjrX5eI3SODUO21HYSr2Kk7GSoQEIcheWnoVgPO
 VbAs9D4bbLbWSS4/yV3OE2fuxQuOVviJrY4Ns2100dMT2CdZsQkjuR1TzraXGflWF9dOAEKK
 Y=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 26 Jan 2023 14:32:53 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30Q42O5X1960730
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Thu, 26 Jan 2023 15:02:49 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30Q42O5X1960730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674705769; bh=j4miW7H4JfEp13E/Sj+Qly/9lxdu3kxkwxQBCQkViUI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i60qvMCZuSX4Uw98nH/pp69i6JPiyGjAJ4RpXZ67b/8WDtPqwA3V4oC5tVASY6ExC
         rzrHwf44LRhkNnUEwKafXXO2rqpMBYnUC359gqImyA7fh0mF13zkvdmMJ2pmHCpkPJ
         6j3bTQVRrlPV3OkyYeT3UuafTgVn3k2Dp0oTs8KRfRcr+mUVIKnvSUGolR/QbUSeFp
         hSfasCnI4kBTiUpe4ahJEZzkPHSU7OD6h+FVi0yUld+wtqe5Easmc8RWpb+Yf2BV7/
         im5LjAZprXA+fniw/DWAiyeFLmt7mRhOdzlj7VXErsWg3n9K9GbTSlmi3SMCsqMedt
         U096iY+q5FzIA==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 4/7] hwmon: (it87) Add chip_id in some info message
Date:   Thu, 26 Jan 2023 15:02:20 +1100
Message-Id: <20230126040223.986189-5-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126040223.986189-1-frank@crawford.emu.id.au>
References: <20230126040223.986189-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Thu, 26 Jan 2023 15:02:49 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

In cases where there are multiple chips, print out which chip is
referred to, in the informational message.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 16394b38dce3..5ca8449887da 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -2505,13 +2505,15 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 
 	superio_select(sioaddr, PME);
 	if (!(superio_inb(sioaddr, IT87_ACT_REG) & 0x01)) {
-		pr_info("Device not activated, skipping\n");
+		pr_info("Device (DEVID=0x%x) not activated, skipping\n",
+			chip_type);
 		goto exit;
 	}
 
 	*address = superio_inw(sioaddr, IT87_BASE_REG) & ~(IT87_EXTENT - 1);
 	if (*address == 0) {
-		pr_info("Base address not set, skipping\n");
+		pr_info("Base address not set (DEVID=0x%x), skipping\n",
+			chip_type);
 		goto exit;
 	}
 
-- 
2.39.1

