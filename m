Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794096096;
	b=pwToVJmzJXOLLWwRdW/Cf3LUdxCtzT9BBMXyLcArdrfFukP3D4LslISQ0SIjVUZ5M6M2
	 qu7Uyd5b0Sq9ggx1F0qWO+TDzAKAUv/cH5gkMsieYgok+yxhWjnloHNNgg8herszRW7hJ
	 eA8Vx6CfdEZfT34ZCPBDDHXzz/0IXEn7XvU23HiAZXSoBuMqGLE6jRZZNg1cJSVEzgjOW
	 NGCDoiPA6+p7hdRjPYxgjWEE52dGTaaNhCAQ1ngQRdarKpgVD1Z5XObb+QaKMnW2aTrMS
	 D/SqPM0QHFULLPB+5WQW1CtwMYaSRN+5m3a9VADaU2RqDX0fll7bRrCPBYl4PPEdu4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794096096;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=iU6kVBRXbxOS0oj7hA2L0WJScDqBjI4nRVFxLPG9oIg=;
	b=45zYgI97YxdMETnkUOBuU/V3+76UeEqw8f6MS3TG88AQ9xMAZcoO8CSy8ER7MsZPabYT
	 wWE5ozVAu88OY+pRMYDUS0VngbcBsvwhL4mWCmq46kYyZOTK/R3FRGvKWJWxEmxp80bRN
	 ucJOsmmQbrz2QX+XTuBU05m51V8I5vCWSrumlYwhfW8tblwdVWYtt80iIT+T9cXXF8KQM
	 yBrdmkxlspwL5m2gguSTMMGo2o3LfcU54L6RngkCpNPY9Kfw4yVLQ8AWLCKeGgOH0fQ50
	 olqcbfJyGF8aNNdaeQZ+r6xjdc7nxmWYtyLN2gSaGce2Tz3MMrH95SXMm5xsOizTbcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=va5k5YXE;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EB9606A326
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 00:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50EB9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=va5k5YXE
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id PldyxyzUJOOJnPqLmxtVyw; Sun, 08 Nov 2026 00:01:34 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id PqLlxXlRMb2qJPqLmxwwtq; Sun, 08 Nov 2026 00:01:34 +0000
X-Authority-Analysis: v=2.4 cv=A7tsP7WG c=1 sm=1 tr=0 ts=6aefbbde
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=zdos1vbpJfyXFnXreKYA:9
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iU6kVBRXbxOS0oj7hA2L0WJScDqBjI4nRVFxLPG9oIg=; b=va5k5YXEKAjH7wWUSUv7Pv+BRz
	QIPh8UC2eG0WeSPe3EMwwfCsPpNiOkBgZh7fN3uzpbaEoIajR5xHZWklXcxNebPRkuauPv938KoJD
	/Uf9XpGe9pgiTYtegs+865OhYRLdF+4x76DJEj4GUgLaiBs5OJcGlFQIBIB7hKxZjq79Bjkq+qM8Y
	dNAeJ+pJ4hoA+vtuHAyK3jwyB7eCbZJeEmfmVdcNheF+bHClRGuUS9wMqjpCQKMq1bjKaxMD+N5ly
	v4HLbRPaTgfYSYaVfKVi2tRyQ1tRzsqiOW9SI4amx9DBBp37B4YYpeqsy0WK07u7d0XzjRiAaPDNE
	iZYeyPWQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:34062 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xPqLl-00000004Dz5-2umz;
	Sun, 08 Nov 2026 05:31:33 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Tomasz Bojanowski <tomasz@bojanowski.me>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/4] hwmon: (msi_mystic_light) Add support for additional MSI motherboards
Date: Sat,  7 Nov 2026 16:01:27 -0800
Message-ID: <20261108000131.1249664-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
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
X-Exim-ID: 1xPqLl-00000004Dz5-2umz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:34062
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCKjlW+Od4uUCozKK+R4FjfBft9U5TO+cBjOZ2EhLIfGRunml0ClQJWyS32F08R7c+hLkMzd0gZASDh523sFJuDAqXsrzVUXVlHwoExvzedoG91V/2DD
 2Ct+99jShjpnUfnGt5TEN69Fom4e5FbrkCJrwKctqmRbbVFfId6OYK+XF18DrNYcW5+V3x4VlQkrG8apS2/W251i+HKkFg4sRz0QWAKrJA9T1TWZ40Pi+IN4

This series extends the msi_mystic_light hwmon driver to support voltage
monitoring on three MSI 500- and 600-series motherboards:

  - MSI MAG B550M MORTAR MAX WIFI (MS-7C94, USB ID 1462:7c94)
  - MSI MAG B650 TOMAHAWK WIFI (MS-7D75, USB ID 1462:7d75)
  - MSI MAG B650M MORTAR WIFI (MS-7D76, USB ID 1462:7d76)

Unlike the 800-series MS-7E61 motherboard initially supported by the
driver, which exposes voltage readings synchronously via a
HID_REQ_GET_REPORT request on feature report 0xf0, the Mystic Light
controllers on these 500- and 600-series boards require sending an
output report to request sensor data and subsequently deliver the sensor
readings asynchronously via a HID raw event.

Patch 1 rearranges structures and per-board definitions so board-specific
read callbacks can be added without forward declarations.

Patch 2 drops redundant hid_hw_power() calls around sensor report reads,
since the HID device is already kept open for the lifetime of the driver
binding.

Patch 3 introduces a per-board read_report() callback in struct
msi_ml_board.

Patch 4 adds the output-report/raw-event read implementation, board
definitions, DMI/USB ID entries, and documentation for MS-7C94, MS-7D75,
and MS-7D76.

Guenter Roeck (4):
  hwmon: (msi_mystic_light) Rearrange code to simplify adding per-board
    read functions
  hwmon: (msi_mystic_light) Stop calling hid_hw_power()
  hwmon: (msi_mystic_light) Make sensor read function board specific
  hwmon: (msi_mystic_light) Add support for additional boards

 Documentation/hwmon/msi_mystic_light.rst |  59 +++++-
 drivers/hwmon/msi_mystic_light.c         | 222 ++++++++++++++++++-----
 2 files changed, 227 insertions(+), 54 deletions(-)

-- 
2.56.0
