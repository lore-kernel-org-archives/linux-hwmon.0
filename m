Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283199;
	b=y1oaJv6B1FQZ5zAWqeCO82GIliRc8l3z1g7CwaV+GU94uqDOyuHjYXc8vjdQjESUjB+O
	 RlkObTc/psL46ROCUJJ7lzxYQKoEPgRjBhKZ5sS4QTzdf53xWZi4ebzdoQb7jtl42ifvS
	 KZXLFoV716hELHaibgXEE56ah498U2RDOr3qD5JHaZMT09axBv4coKR9JH0B5eVGcFLgE
	 b20b2fKjKWp3Ug8hjygckY9dEKGh+YuTaA7MVv47Wvo80JEf6Er0GS4abh3EVeeS4JrDr
	 0cm/TfCwQm/IXckzEKtnStYKdmk9ur8cnQkTIfn2+sySOzauGhJslhS7ydP9PNZR9GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283199;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=D9WdZEkp14Pu+xSJ31Bx5Fow1Mud1l3nol6pjoJS1HQ=;
	b=QlwsvDAnfv4k1tSIqTZ2hPGLNLDEYOjw46HyezivanTSKIiFgDnthumVrx9V8OGc0gOk
	 HpLjB/gNIQh8to8iMbMOwCDaWaugQ3slSrEBYlsRd9ljVheR3HebbRZqk6a+Ky6f/bSJP
	 Y3Wqyut7Ry2upiFWdf889L9qJS2yGd49XhN8mqjY34gW/OaWQBcYVN9ylFVJtRPhe8v3S
	 uZV/320DEy43FlAkbs6nNaZtYG/Uu1WCvO3sICyeOhJFy9l45dhl84pIoFhjtJIfq+KaE
	 BN9bXds6zKMG3Yla/X3AU1Bw5sinF1Tv4WAn19XLqAYKPZrYdYwaGbaN9QDSKN0YXvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Ha3p6YWW;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA5E606A31C
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 03:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DA5E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Ha3p6YWW
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id QPunxBN3fyb4YQd1axr4G9; Tue, 10 Nov 2026 03:59:58 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Qd1Zxu0s6YskhQd1ZxqG96; Tue, 10 Nov 2026 03:59:58 +0000
X-Authority-Analysis: v=2.4 cv=CKMqXQrD c=1 sm=1 tr=0 ts=6af296be
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=c92rfblmAAAA:8 a=1XWaLZrsAAAA:8
 a=ZSZ1G_ixoNvDJNnLE98A:9 a=GvGzcOZaWPEFPQC_NcjD:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=D9WdZEkp14Pu+xSJ31Bx5Fow1Mud1l3nol6pjoJS1HQ=; b=Ha3p6YWWmERuLCFvvITr9t8W2I
	PsNDKximLDze3JO1Y1pbQWYi59oWvHUHqL/4n2h8u7Na2rfaUG9x0yAehCZoAUTN5bWoJQSNsBFup
	zlacWJxn9R2QZ3x4PxtqLBQHsgup2jgbk6uetfoeKmXPbADt0MalDf1ipU1fm33NB/PlpksjFXBQv
	3veEWVaR2njq+5JoQBm4Iqy3Mzm6bwVv1Z68K3Kgt3gqC+Zuk5ft73jY0+EO+4I8xffdVDD1O/bA3
	b5nvFiUyYXp0yLFRqyGzWo4hXBeAnWriKCPC0IjrlGo1xJjb/X560mfuuzfr8t3xan1mgCOEiGHF/
	MSKWZVmw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48876 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQd1Z-00000003RXz-1Ium;
	Tue, 10 Nov 2026 09:29:57 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Anton Lundin <glance@ac2.se>,
	Guenter Roeck <groeck@google.com>
Subject: [RFT PATCH 0/3] hwmon: (nct6775) Fix target temperature and tolerance handling
Date: Mon,  9 Nov 2026 19:59:52 -0800
Message-ID: <20261110035955.3968731-1-linux@roeck-us.net>
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
X-Exim-ID: 1xQd1Z-00000003RXz-1Ium
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:48876
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNl7ohOo9dqVke+txuxDWAxWNtvcY64w8nVD6gLDCkZPrMZsYKtIgdyWjItgWrb6qL6brN++4exRONrxuLa6Xpjb6U+8OnBIx00WUgnmElJZZO60L3uy
 727y/Kj9hnBJ3+a14p3GvFZfMtK5ei0uCULDQbkvEMLKIpUDXiimDr09QqY1rdgKF3yVSzlcZhOC+1/DiU7Fbf5kBnXbixg2/vaC4JA8qxVJ0jqqAHMRixoM

From: Guenter Roeck <groeck@google.com>

This series fixes three bugs in fan target temperature and tolerance
handling in the nct6775 driver:

- Patch 1 initializes target_temp_mask, tolerance_mask, and
  speed_tolerance_limit for NCT6106, NCT6116, and NCT6126 in
  nct6775_probe() so pwm*_target_temp and the tolerance attributes do
  not read or clamp to 0 and REG_FAN_MODE tolerance bits are cleared on
  updates.
- Patch 2 fixes the inverted index check in store_temp_tolerance() so
  writes to pwm*_temp_tolerance update REG_FAN_MODE and writes to
  pwm*_crit_temp_tolerance update REG_CRITICAL_TEMP_TOLERANCE instead of
  each writing the other's register.
- Patch 3 masks fanmodecfg with data->tolerance_mask instead of a
  hardcoded 0x0f in nct6775_update_pwm() so bit 3 of REG_FAN_MODE does
  not leak into cached tolerance values on chips with a 3-bit tolerance
  field.

Disclosure per Documentation/process/generated-content.rst:
Patch 1 was reported by Sashiko
(https://sashiko.dev/#/bug/linux-76f191d0-4c79-4982-887e-e5c9a2ed7136),
and patches 2 and 3 were flagged as pre-existing concerns by local
sashiko review while reviewing patch 1. An AI coding assistant (Gemini)
was prompted to investigate and fix the Sashiko report, fix the two
additional issues reported by Sashiko, and write this cover letter; it
generated the code changes, commit messages, and cover letter text. The
series was build-tested on x86_64 with W=1, verified under User-Mode
Linux (ARCH=um) using an out-of-tree simulated regmap test module
exercising the affected sysfs attributes and register values (not tested
on physical hardware), and checked with scripts/checkpatch.pl and
sashiko review.

I don't have hardware to test the patches, therefore I am submitting them
as RFT.

Guenter Roeck (3):
  hwmon: (nct6775) Fix target temp and tolerance for NCT6106/6116/6126
  hwmon: (nct6775) Fix swapped temperature tolerance register writes
  hwmon: (nct6775) Fix tolerance bitmask when reading REG_FAN_MODE

 drivers/hwmon/nct6775-core.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

-- 
2.56.0
