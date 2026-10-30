Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793386416;
	b=3M0jxMSGCEzUtiyjgAoM6IJBS65gSk9/LuAQFtrIZUKPs+xfRJQqNibKQBmOZhr5sKFx
	 KHRlMKGhGKi9KD0/wUZFrTnop7lpjeRis2TSoQwTJX29UCTaJJlowlwmOxLmKyRxQsaX1
	 uA8i2LGJvaNAwguO6wwlE9UC1vex3E/vzddhlQpmMNDyf8grxshXshuLU1RvoUqyb0886
	 4BMrtgfMWAkPjo/OXHHS13wv16+nTViTgdh4mDpM7ZAxcE/u0iIl1keOpcwXd8VPDX7Z9
	 49tlQKzxLaelhe/PJz1l5w2NmdDNjp7PpL7ERmDdy8QRZiZmAuz2Ijd3LZ8JvG+AoYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793386416;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=QrM3f5PNwRORG0Gq4jA8xNHbX2tvXSjcfyBPCE+JiDw=;
	b=UuCTiU3ZuisMDF9a2Gp4NCLtBHh62rZVskRQBtUfzH29afqRkQ6vm06HpPUZCi0fZtaG
	 Re4OMIAE4g4yevtDDpolnfVk8WSeqxaHh5g6iQb4Swtzmh5XhqX5VEFh3d1LPuz2lODX2
	 QMx8gNik5HUGA14ASfZN8RxpN6ux4YW9VGVxuxb+VmgrmbGP0WnOdRU/KP58Yv1cRS8GD
	 On+AmC6/T6lELqMr9kOj7x4Q1V92ieVaECH2tB28BsOqET2LeByWyBBAOIX5BZpqORKeo
	 dwdts3+WB60OvjlIqzB1htJ7UoNBX7lktqXBiij+0Fjyp0KEL6UrJIZCaqfC4RZHdkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=QBBhZlrL;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A028606A31E
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 18:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A028606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=QBBhZlrL
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id Mo5Kx2tFwusRSMrjLxYrLq; Fri, 30 Oct 2026 18:53:36 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id MrjLxukeVNSXiMrjLxSjYO; Fri, 30 Oct 2026 18:53:35 +0000
X-Authority-Analysis: v=2.4 cv=JvXxrN4C c=1 sm=1 tr=0 ts=6ae4e7af
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=z62BTclffCP-bmtVfUEA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=QrM3f5PNwRORG0Gq4jA8xNHbX2tvXSjcfyBPCE+JiDw=; b=QBBhZlrLkAAj
	wTsw3g3122Ie10MaZCEHwP4TgZ/TIXbqw0LbVbcM5TZksKsXNEFvnhlb8LhhYkDQAJhHS1ZUxRWbf
	H7Ne181BiSe+6lJfEp8JE2cRyBGufKBjTdw5DjhxSbMXHXX5Zil3l8m5NzQI6GlgTtwo2nax4Shyc
	d393utS51DZlvVXPocHfc5z+lmN6SlzNy8gVdYQj5HyqjeHd9Uw3EShADBYtyFU/dl7CjdQnM5Q4+
	77LYbBnXiIzU6S1gl6RRbnONY0lEyOugPlPjZYqTKRNKtox7FZA8srZfO84cHVtjB9+SNcuU3UeUk
	brbvpcKYD0Pe/zYnWnaL9g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48446 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xMrjL-00000003RZ4-0LLz;
	Sat, 31 Oct 2026 00:23:35 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 10/11] hwmon: (pmbus) Release devres allocated memory after devm_thermal_of_zone_register error
Date: Fri, 30 Oct 2026 11:52:55 -0700
Message-ID: <20261030185256.976255-11-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261030185256.976255-1-linux@roeck-us.net>
References: <20261030185256.976255-1-linux@roeck-us.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xMrjL-00000003RZ4-0LLz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:48446
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 27
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHqeTPiNBi9srH3LJyfK3LNvTiSgU3JQfbiwZ/9gapOpftvXX4RbdLQgLR74JEt2iZCwA1nkQqME9gSy3BN5F+K20IvGLz+eh7tifpjNLpc9Zzzh0i28
 cZj6GiuzAgRCkytGAf5FiRlXyXCcIiiy27oLXdtVGl130EmGOcPO/2m011UnLYW58fkm6Q3qKhI5f2X537VvTq1JO7P4eSc4bw7YQ+4SZg95P3W6O3IDpbeR

In pmbus_thermal_add_sensor(), a devres memory leak occurs when a PMBus
temperature sensor is initialized but no thermal zone is configured for
it.
The function allocates a pmbus_thermal_data structure using
devm_kzalloc(). It then attempts to register the sensor with the thermal
subsystem via devm_thermal_of_zone_register(). If this registration
returns -ENODEV (e.g., when no thermal zone is mapped in the Device Tree
or CONFIG_THERMAL_OF is disabled), the function intentionally catches the
error and returns 0 to allow device probing to continue.

Because devm_kfree() is not called on the -ENODEV path, the unused tdata
structure remains allocated on the device's managed resource list. Since
most PMBus temperature sensors are not attached to thermal zones, this
results in an accumulation of unused objects that needlessly consume kernel
memory for the lifetime of the PMBus device.

Add the missing call to devm_kfree() to fix the problem.

Fixes: 3aa74796cfd0 ("hwmon: (pmbus) Register with thermal for PSC_TEMPERATURE")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 9bccbf41c884..574d9879bdcf 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1535,8 +1535,10 @@ static int pmbus_thermal_add_sensor(struct pmbus_data *pmbus_data,
 	 * If CONFIG_THERMAL_OF is disabled, this returns -ENODEV,
 	 * so ignore that error but forward any other error.
 	 */
-	if (IS_ERR(tzd) && (PTR_ERR(tzd) != -ENODEV))
+	if (IS_ERR(tzd) && (PTR_ERR(tzd) != -ENODEV)) {
+		devm_kfree(dev, tdata);
 		return PTR_ERR(tzd);
+	}
 
 	return 0;
 }
-- 
2.45.2

