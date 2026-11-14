Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672816;
	b=eym4w7dP+6dxlm295AOft5I9MapXY2H2ApUYg9jlxsEn7AbITGuwKFy6fGF9qene484u
	 0zRSc7N/VxKwtVyLEOZ6ejvUXc1LU+wMjW8/pCka15h3S9M5cMkAqJ6XXtOB77v2i+kgf
	 gCIgeTJrPcJixfKxTuPpe0PetHXCK2HVRqolQb72TG36Z2W/1H8A1B2hJ7nR/VO245Tr2
	 5BdRyBCH9wpjQrcyV60e9sSAODKoRGed/8FRzwbYW+t5INIuKPr2nrxxNzyU5ivXEWOb+
	 w+mz4WJBUJKgrpZN3+aob6KyeIEoLgI8WfG8K7xng6ceh6xq/WMs8rh+nfUjN25y2mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672816;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=mbytoUa3tRKFqWhM1UcVL4cxUggurP+uHf5s9LyN1+8=;
	b=4NcDoDpF+BQeuUTrWUBEZljCarjaBdUIgYZYl0+KIx8W9B6t3oxNLU6qRDIBux7rfyIh
	 exqPzxUUAY68TVNeUxW3Wua7XavirhASdxDAaFh0kG3w3HBXRXLSeWjLKlMH/QMWiyWd4
	 Z3IEQQkwDMfbwOoCZHBeWCsPQJ5x7+gCJmdcOtiP0YFlCg4BWwj1eCHqvH6w6tqNfYGiv
	 jj449TyGazf9iuuDVbttqPe0UKq2JYPUHfhLVPUauSmaOh0rN3tnqZ0O6/iXWAqb80/V6
	 BjbZ0089kigxz5tojTBylwU8kwcO2gegYqBwlAnB4zm64b8vqelh0JUx21CtYwKYsVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="idl/s72I";
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD5D606A327
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 16:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FD5D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=idl/s72I
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id SBUIxH9Ip4vCDSGNix0K0L; Sat, 14 Nov 2026 16:13:34 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SGNixvzt7YskhSGNixYfAN; Sat, 14 Nov 2026 16:13:34 +0000
X-Authority-Analysis: v=2.4 cv=CKMqXQrD c=1 sm=1 tr=0 ts=6af888ae
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=0nlnqQntNI7bdpd6a1oA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mbytoUa3tRKFqWhM1UcVL4cxUggurP+uHf5s9LyN1+8=; b=idl/s72Ih7T5blQkDjxSONfflW
	V7NAGQOQ8VFhC36M+LC1EkC+GYOF6JK3WVp7gJl83Jry/XsnFZY0tGeBK48s54xM5K2DbEmzA/SBv
	d4o9KE1EPiumNOi0kNdw7FxraKIoznfm2/BY7Flko6HZzDF5acymV8tElLqPdHj+QYq/WEZ4AsaW7
	Sdc5UV2Ba0aMMAngewRn9HK+GZjXWW9PMDGklyaMH+RnyevJGd9i0oMFr03ArmbZzgaxdjlPPfz8O
	NLDlKOiQ/oDH8uFyp8yUYeC2uDDznN/5GvxUray86HM2vGY/Fct2BdR9ivu2lYynwj3SDrzSQzNdl
	MmjlsRrw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:35394 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSGNi-000000006CK-0Ui3;
	Sat, 14 Nov 2026 21:43:34 +0530
Date: Sat, 14 Nov 2026 08:13:33 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Johan Dahlin <jdahlin@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alwyn Kik <alwyn@kik.pw>, Fabio Baltieri <fabio.baltieri@gmail.com>,
	Hamza Mahfooz <someguy@effective-light.com>
Subject: Re: [PATCH v2 4/7] hwmon: (nct6683) Enable fan control on ASRock
 BC-250
Message-ID: <9e51a722-b1eb-43f3-8fcc-358811ec7fd2@roeck-us.net>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
 <20261111082838.1418051-5-jdahlin@gmail.com>
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
In-Reply-To: <20261111082838.1418051-5-jdahlin@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSGNi-000000006CK-0Ui3
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:35394
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 45
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAOixLGqxEeiGu6ZYx+bm2phR12WX+76UllSrbL+beojSrUOvNsoxifDS56dIASzEe4um9wauLMYGBCg69Qce26SPFPf5slB8iC8EhxwToRNj60QyBkI
 DX6NRK7y9EqqonuMa3myyeuz6jSlCYvLTXEl79a4fVLInah4o9FQ+njdfqy/xXTz7wSjs9+T+nmypuQcFZ31GJg04npyMYs1iU+k1lHzMMxcBhY6XyphIsl8

On Wed, Nov 11, 2026 at 09:28:35AM +0100, Johan Dahlin wrote:
> The ASRock BC-250 (customer ID 0x162b) has an NCT6686D with the same fan
> control registers as the B850 Steel Legend WiFi, and manual fan control
> was reported to work there.
> 
> Enable fan control for channels 0 to 7 on this board as well.
> 
> Suggested-by: Fabio Baltieri <fabio.baltieri@gmail.com>
> Signed-off-by: Johan Dahlin <jdahlin@gmail.com>

Applied.

Thanks,
Guenter
