Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793DB255F52
	for <linux-hwmon@vger.kernel.org>; Fri,  4 Sep 2026 01:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788483710; cv=none; b=fi03aCfmaX6qQeG8Awi9MkAe7mgfBDId9Be4U0qfEKPbXG95ghOq0R8x98h4o7ftTs86xoQTj3YiLbJf+yZHW0twRxlaMuwh2qx4UfYgeUsXlKLWEiFKB3Mb8SBsN+Um0izSE+ThL+VFen+iBldNHyePgzqUrPDBNjsIlTsx9Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788483710; c=relaxed/simple;
	bh=SXdXNETc4nF4n+5oIJuy/9vYvKqq6+vMPqp8gv98X8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=czAPAEJJp5zg9kvaLvohlv7L+slRxbFlQXa9u9iFTSNR1olPxile3O0reX+6kHvBFEgYHqd4nczMtnoftgGuBmRQr+vjmdWsU4nWBLQoLkm2plGx0SONgYPs3zASWEblv+NBQCJ6czZgloxyPptgJC4GpA6O9JXQM14Ydq51D7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=jjJlGNDm; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="jjJlGNDm"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id DEFAA2C08BF;
	Fri,  4 Sep 2026 12:53:57 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1788483237;
	bh=RxO+idj2oAPw0qZZU8g6oIfwilN0v9qfkYBU+43FhyQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jjJlGNDmV8kFBc9V7FoNA2DgaH4iNr2nlfOOfxMvMcisizYYFf9UHXdYtPO/5jpHV
	 9VJAsBXQ7BCpUE7x1Uw/GusurRjI7A3E/EXJ307B3hmS/QJDc4ZMIEMAwDxuPSWNHm
	 KOoUVSVsx2QmsQKLzwwgHxFDV/cBBwzDt9/y941fA6HXNApb+vBMIHAQ5IDXplw9Sf
	 Q7gZGC+SzNSFEKEwbOK1165arZKzhJNLQcZ9+ha3xFDw0PWUI73CJStZB3o0RJBTeq
	 68u/mkC1umo/1ffNVLg2Y1YVQt9jh87HNXBpue+X51L3I65cyq4lPS+L0LsFOucgLN
	 geZW90p6kGx/g==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6a9a16a50000>; Fri, 04 Sep 2026 12:53:57 +1200
Received: from aryans-dl.ws.atlnz.lc (aryans-dl.ws.atlnz.lc [10.33.12.26])
	by pat.atlnz.lc (Postfix) with ESMTP id B91DE13EE4D;
	Fri,  4 Sep 2026 12:53:57 +1200 (NZST)
Received: by aryans-dl.ws.atlnz.lc (Postfix, from userid 1844)
	id B82DC605E4; Fri,  4 Sep 2026 12:53:57 +1200 (NZST)
From: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Subject: [PATCH v0 2/2] hwmon: pmbus: Add tps546e25 to generic pmbus
Date: Fri,  4 Sep 2026 12:53:50 +1200
Message-ID: <20260904005351.2136374-3-aryan.srivastava@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904005351.2136374-1-aryan.srivastava@alliedtelesis.co.nz>
References: <20260904005351.2136374-1-aryan.srivastava@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CKmJXgrD c=1 sm=1 tr=0 ts=6a9a16a5 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=VdqzKS8jKosA:10 a=O5u-Ys2qmj4oq47sXCEA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Similar to other TI DCDC devices. Operates over SMBus and is comapatible
with the generic pmbus driver.

Signed-off-by: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
---
 drivers/hwmon/pmbus/pmbus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index b629acbffbfb..96a72950e7d3 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -245,6 +245,7 @@ static const struct i2c_device_id pmbus_id[] =3D {
 	{ .name =3D "tps544b25", .driver_data =3D (kernel_ulong_t)&pmbus_info_o=
ne },
 	{ .name =3D "tps544c20", .driver_data =3D (kernel_ulong_t)&pmbus_info_o=
ne },
 	{ .name =3D "tps544c25", .driver_data =3D (kernel_ulong_t)&pmbus_info_o=
ne },
+	{ .name =3D "tps546e25", .driver_data =3D (kernel_ulong_t)&pmbus_info_z=
ero },
 	{ .name =3D "udt020", .driver_data =3D (kernel_ulong_t)&pmbus_info_one =
},
 	{ }
 };
--=20
2.55.0

