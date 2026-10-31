Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793460933;
	b=MhPkewbN0hoYpREcMm2bGEWg4P2P6Ky9uGhJoGfb3xMDwAeOr/CxPqp9+6wYR+IGYtOh
	 SRPARjzKsJHkFBFDjFYGuwcSAPEPdflTzHvU8wBZwjyG2ynTnQvpI0vDnXBlAVJuE72hA
	 3yPLoUlPnW3kPj2jrDVvOBdeV3UvPgp77bUZ6L0fEChmyBPZjYzCeGkk7jJhcjFacDS39
	 u52G4PbOVSpCUqMDX2z1LW9mCOxbLloG5A7q/25V7/xaTCfmGOQcD06qRPWEztosLZu8U
	 7KqU5jzxhfha08QxtC/pjawPmUIe/9yphOUNbPLWCPfJKLH3bz/IUtAFSfhf1eP5wUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793460933;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=3scig74ZZcz2BaFne4DCYkhan/lgosEseBGgvZyMEOw=;
	b=LtBASEzBi0wIkuMlCVw7G6dhybxDKyUtV9/bAzzziPwtbmFMmWaQRORL5nO8KZGqLVAz
	 TqJe/i4SIHFXPFpUS50hUuB6YCnmO5LmPJ3NTuciIddbLtKtD+cuvujkGmHtm3kKxFcm5
	 ViQoS6P43wEIu4q3UYc70FfckBgczz3QB8vTuwUBCO1P+/mOqxVztZHm5IRILlNwxYNxY
	 tblxf8cKJwgJ8e8/s+ubvVJoJseStZEImvQJhfFH27X1JvBaGXG9Ny7WuFa6Z83v8XvRi
	 MkuRtqSvDuMLgsf9WwDHxrMtem3dgGphytswQdlMwwKk8K9l5R011xawQbYVMoLAkwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ZdpjMOW4;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9AE606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 15:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B9AE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ZdpjMOW4
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id MqtVx3aWXusRSNB7Exe8Qz; Sat, 31 Oct 2026 15:35:32 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id NB7DxlAeXQfwNNB7DxFCzg; Sat, 31 Oct 2026 15:35:31 +0000
X-Authority-Analysis: v=2.4 cv=bfprUPPB c=1 sm=1 tr=0 ts=6ae60ac3
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=8cRJjQL_2ntYDDQzJl8A:9
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3scig74ZZcz2BaFne4DCYkhan/lgosEseBGgvZyMEOw=; b=ZdpjMOW4BejqyhsnHXjzvwGGNm
	sooa3lv9x58r/TCxlSMBdjH9uVJIWzgMN6e3PpehRfcWYb92IhqthE7wQ46xhqHUIJSD4owH6oTFJ
	cK/ZRB07mHLnSdrnv7RtBbQF1tyL5uZtuz9/drZAbvEMspwWwegY8lQo3EGe7kord/M61Y2jSTpuv
	4eQSRTdqCRzohBI0SUPK6lRbSUZKzlrK/1ej6vaLRz/bEcLtHNoWvxMciIQyUB/tQDruhwhdde+v/
	aNa1JAki65bxQEmYqDYL1++frmzoLq2ntq2V9oYfzhYuGAIbP1sE29xTtxQaFhc9rgEGguSz1/fG9
	vkTSVvvg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:60482 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xNB7D-00000001q0n-0KgB;
	Sat, 31 Oct 2026 21:05:31 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/3] hwmon: coretemp fixes
Date: Sat, 31 Oct 2026 08:35:25 -0700
Message-ID: <20261031153528.3195123-1-linux@roeck-us.net>
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
X-Exim-ID: 1xNB7D-00000001q0n-0KgB
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:60482
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMU5vVBgbftQccEMsw/2YpB5cxmL8U7pdGUVT1hravkVAQ0Xi/ejxO6OlWKD8SDhyxxTVCVR7lx2+B4w45VQ7XSVgt8TaylTAsYpPPy+bwlofQxJvnwE
 AaCciNeznKG+z9fFRk+LdXrfobzlKFtZZvd8RuDaYmpaGIFUdRgiWlZEhALC0JrflrwM4by3W+i/PYpoa6i9+q9wb1CA5SO9jtGehHiedaDoVyKeT827a9UP

The patches in this series fix bugs identified by Sashikoi and confirmed
in a session with gemini-4-carbon, which also implemented the fixes.

----------------------------------------------------------------
Guenter Roeck (3):
      hwmon: (coretemp) Check for NULL platform device in hotplug callbacks
      hwmon: (coretemp) Set nr_cores only after core_data allocation succeeds
      hwmon: (coretemp) Fix 32-bit jiffies wraparound in show_temp()

 drivers/hwmon/coretemp.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)
