Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108765;
	b=yowhyHFsJvXBO5EUjQzDwtE44RpwYuYbxRujIQo/Bo9vQaVlgYsiRYz9AUO+9REXLa3K
	 KQmxeECoHwCL9cmkYMAyCtHZUWsgW3EI/5f5zHj4ycroASTg5k+2MhCTIgrUYPLMwJ4vI
	 t1qmptooiZWXm/ebAtMV9ezBKuR8pnDJGnp3JU8ErVezyAE+7NeCrOKaF46G4SKcY2lK1
	 VQDBGwFiFF3Z86K/kTfMgYp5L2mVwkv+rxxBgdupxUpdobb9XFBoV0XqDq5vei9voQDqS
	 00vBJmudF3pCLziaCWLaUQuCiwfasm5aWF1y84+/DNCGc0IANPtdGeGW7bTglY7jwmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108765;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=5dONtr4sKABqwuHoz5+pHwYIy3dykQ80Esiv0kFGkuc=;
	b=eet+eiHTjgIdm6hU6nLBhe0RXAqWM3QLWsPkdK2yHhkIpjUHJuBqPq8zP7Bkzy1gjPxZ
	 q3l2U1AjETFfz8AkS4gDiBPB1AuOTy3eOEsjAKy5ZxDr/uPxQHU9Qk0+nbVeLC7rERj3c
	 86PFSZubrQyCBevNhSEcbsxvc1dVUPplza3lGAsfHxFfJYB9GBm2qKg31+AhxgpTo/4u9
	 K/C5fwxP5t5zZ6p9aHM5psh6g9s0l9KVzC+hxnLeC9tU1WtqE7nDmrYNfhzQDuPL+9jI6
	 KxLAtpnOwnUGNPOS2U6vuLBeybRoxnGEfB8s1yoWUCU2i8orjLcol3JSRYpUMITdgpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=JEQx4dyu;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AC7606A325
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 17:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1AC7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=JEQx4dyu
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id U26Tx0L9vOOJnU5n9xdrqO; Thu, 19 Nov 2026 17:19:23 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id U5n9xdTkuuJrPU5n9x41me; Thu, 19 Nov 2026 17:19:23 +0000
X-Authority-Analysis: v=2.4 cv=WLZ/XmsR c=1 sm=1 tr=0 ts=6aff2f9b
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=4rZXt00JAAAA:8
 a=a_U1oVfrAAAA:8 a=EHeVD8HU_Sq2t8sKtPIA:9 a=CjuIK1q_8ugA:10
 a=7uy_MM2TgZVoQAy_xcjM:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5dONtr4sKABqwuHoz5+pHwYIy3dykQ80Esiv0kFGkuc=; b=JEQx4dyuJxCucDDh3eTMn/XJZJ
	bABpSTnWI+LvQH9ThNBFJ5mIXDdeAVGnVmN4MWraCwycZ3slZLaxDN0IfyA8OSlFJWyGLF8CJeOzf
	ORV6+Hw1lTAJ/EyiyhgG5XxbWGaVkND8yT7mzPgGdo4iUVL+msdV3sEBQfQvTHlwAi3qQDsPfFKw9
	ASwJZ4Cc2C4SAzH1tgHN2Gw3yeZ9vqKhjKER5eYDyCWJtKFhutpZ+b1Fr8/1008aRHXT2XYRfkccW
	Ugcu+X3rAmLjzHUk+9eNFfea+6CEBOSLLKyNA1IaRcfRe/owSHsShPKJorxG5WobyA8ZiKvMWNrTp
	XRxoyO7w==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:39840 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xU5n9-00000003Vln-0ItL;
	Thu, 19 Nov 2026 22:49:23 +0530
Date: Thu, 19 Nov 2026 09:19:22 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 1/2] hwmon: simatic-ipc-ec-sensors: add BX-54A EC
 driver
Message-ID: <2616c71b-f352-48f6-96cd-98291012a616@roeck-us.net>
References: <20261119164708.1280862-1-benedikt.niedermayr@siemens.com>
 <20261119164708.1280862-2-benedikt.niedermayr@siemens.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119164708.1280862-2-benedikt.niedermayr@siemens.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xU5n9-00000003Vln-0ItL
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:39840
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 10
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAs7ebAyTlCL/4LeIlIr/A1MNsAUvrK+poMaAQ7g+Ql30glROV0ysIhTTgYVzYcNr8wWkwz8MWJf70KEAi4xTVLXpl/olam7NAUFVIx7EEaL+CSu8yHZ
 1Gj5U9EAFCHTuGQnjSl4NrOilBkCVxe5uetp/NWBZh983RUv5Tftwzw1vYMaXgICKZ78gzSF42U1ara07nysjDdBluU5lLQS0Pvn9G8YHNbI7Skh6jXl/pl9

On Thu, Nov 19, 2026 at 05:47:07PM +0100, Benedikt Niedermayr wrote:
> Add a hardware monitoring driver for the embedded controller on
> Siemens SIMATIC IPC BX-54A systems.
> 
> The driver binds to ACPI devices with HID prefix "110A" which is
> currently a registered PCI ID for Siemens [1].
> 
> Looking at Dell, HP, Lenovo and ASUS this seems to be a common pattern
> where vendors define custom ACPI tables for platform-specific features
> that are not covered by standard ACPI tables (used by the ACPI EC
> driver at drivers/acpi/ec.c).
> 
> [1] https://admin.pci-ids.ucw.cz/read/PC/110a
> 
> Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>

CHECK: Alignment should match open parenthesis
#426: FILE: drivers/hwmon/simatic-ipc-ec-sensors.c:266:
+static int simatic_ipc_ec_fan_read_string(struct simatic_ipc_ec_fan *fan, u32 attr,
+					 const char **str)

CHECK: Alignment should match open parenthesis
#479: FILE: drivers/hwmon/simatic-ipc-ec-sensors.c:319:
+static umode_t simatic_ipc_ec_is_visible(const void *drvdata, enum hwmon_sensor_types type,
+					u32 attr, int channel)

CHECK: Alignment should match open parenthesis
#520: FILE: drivers/hwmon/simatic-ipc-ec-sensors.c:360:
+static int simatic_ipc_ec_read_string(struct device *dev, enum hwmon_sensor_types type,
+				     u32 attr, int channel, const char **str)

CHECK: Alignment should match open parenthesis
#536: FILE: drivers/hwmon/simatic-ipc-ec-sensors.c:376:
+static int simatic_ipc_ec_write(struct device *dev, enum hwmon_sensor_types type,
+			       u32 attr, int channel, long val)

Please follow Documentation/hwmon/submitting-patches.rst.

Thanks,
Guenter
