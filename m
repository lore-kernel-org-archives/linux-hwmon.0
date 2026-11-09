Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794249014;
	b=DNfHGi8+4yovBDXFv3W2+luMAy8VqWQS4dsHzX7kY558CsDO07+O2/eWohrSXSSnVV6t
	 ZDk91Ky05km4MaF9Bc6v7ZT0uwopObIoQSzssbDCf5Ohjretjk6PJleAsc6Sy6ZOODJ2Y
	 6tfx8vrUSY0nPRUI91T0EYGApkY4WvTrf840aUPRD6ZdLDKdEKwVpNPyr6+Tne6Hds0/I
	 QIYami1oGLghWbCc0xSH4bKjoDhpRF0LT/Obf2rR0AuIOzYSAsRokckdpdSc9lUm1p+oS
	 H7rzyE/QpP38+Gtjhge6IudU4XNCjuNM43VGphL8b5SqB7+uaBaKeLcis3Emap58pqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794249014;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=JO7i2PbvJxkMBIYytW43lBbqQOqbXp9HMNMYIEmTY34=;
	b=gURvhsaU6fNGaQv0JTc4B2F+v2FqqGEtxzlSZCO4QU0oYSCe3u1nO3RybYLXYcBkOdCH
	 iFKzJ1bDVKc9uznCTgEBDgu7h2KJAlRKGzpPkOnU1kwFGV92Wwgbdanyy+n3yy6GOs1sL
	 T5EsqpFaMbrT2HYY+knGvQ2EIdQMYg2p9OWZDjufqoPYU8t81qERPon4vY/UkKu3xeewT
	 rA8aqjSoWObee40ltHnbD5xETqTgo8Tlc/9vP0jczrzKeJoS3qbWjj/9I4ITqjPpSLLNh
	 HhIJU03Fb4dtl4vmyWTyksbfVKOpYB9/zq+UqMqXfcvL4F5GRWGwrFa1v/sM8wUdFqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=T5XNXGIn;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7455D606A5FF
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 18:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7455D606A5FF
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=T5XNXGIn
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id QPktx4wiHOOJnQU8Dx4wi7; Mon, 09 Nov 2026 18:30:13 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QU8Cxy3J18cn4QU8Cx4f7H; Mon, 09 Nov 2026 18:30:13 +0000
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=6af21135
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=vQ2Orosr4Im1LJnRkBgA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JO7i2PbvJxkMBIYytW43lBbqQOqbXp9HMNMYIEmTY34=; b=T5XNXGInbjcJ0sMEsiLiHSXCc6
	YEUuIIETs63w++wr9RPCW6k6UZ8XZds36fWdd/chQkjyO+V+UZxcxNliJJT3umNmi0+aLCfpDGblB
	uRJv9Tk1WEJRNm20TiJZ+QXgrj+xQ3UudgrKIbuI5PbgVgtztGvRzRCG+GGzUWHndmlczTvuDBfz1
	0LSYX5mzUUF1TbMqe9N7VcKvYoh//n9m2F3I8zfStmR4PxDu3UM6oufH//79dnLmK1d5XZLcR317p
	z0nx3/s4OUZ73Z6KtKJdqFMBc6COklnmcdYZ5uS7nJXhvevAEJ8XmNaGABcrxJA9//Nv1zXVe5wQH
	pqReo8Ng==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33840 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQU8C-00000002stQ-1d8y;
	Tue, 10 Nov 2026 00:00:12 +0530
Date: Mon, 9 Nov 2026 10:30:11 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Rupesh Majhi <zoone.rupert@gmail.com>
Cc: "Johannes Cornelis Draaijer (datdenkikniet)" <jcdra1@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (aht10) Fix update_interval overflow on 64-bit
Message-ID: <c77461f5-5d19-4482-9c6d-da6b3d52b69b@roeck-us.net>
References: <20261108172651.220121-1-zoone.rupert@gmail.com>
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
In-Reply-To: <20261108172651.220121-1-zoone.rupert@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQU8C-00000002stQ-1d8y
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:33840
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 11
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGdzJWOMGabvLuSe+GWWcMIK+kDzJuxRJYD6rNIFO8Hr1mzysLhMM8ACQaZGVAm6S1LiQepKDbkfLEdIpVWPTA0veFoUj5aoeVMr/OtN56kCQQ8SP0ME
 amNn1jRVfJxntkwjhdA+BXCs4cyi1dqGztTOxB4IfzRUq9OMdYlvaAigJhqdY2zdSqe+xc37rtI7BlHgNTqCN8UNJxxOs3cJpKSAJWxJwbxuvhEXdrihi+i6

On Sun, Nov 08, 2026 at 07:26:51PM +0200, Rupesh Majhi wrote:
> On 64-bit, update_interval writes are clamped to LONG_MAX ms, but
> ms_to_ktime() overflows above 9223372036854 ms and the interval wraps.
> LONG_MAX becomes -1 ms, so every read starts a new measurement and
> update_interval reads back -1.
> 
> Clamp to INT_MAX like sht4x, so the limit is the same on all platforms.
> 
> Fixes: 8c78f0dee437 ("hwmon: Add AHT10 Temperature and Humidity Sensor Driver")
> Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>

Applied.

Thanks,
Guenter
