Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672123;
	b=CFkvF8HRrwoKQkRtlwQ+qD22njGUDcfdnZ39Hc6pYJTskqRsypDqoif2ZqPv3juuMeQ0
	 A7kNRIiRP3i1+46exnn9yvNNgC2d6pknVLPZZ66f7RNSBd5b8jPRX3NlBNL2i5LOJysRo
	 ogtorYFFBY1Ymi5BlFcRnutEJaUKb288XiBCwxmObT2HXkRgRys8hyb9Y3BcdPgTltuZV
	 Ypi5okd4Yiy8Cw/u11FYdqWM8NYwesGkCYZKstOjQ/PoCIx55vrRWaNZz8BbuzwWr0SSd
	 rYwtXURf/F7HjYdtduTwf2EGWFrxv0MsLmGxfMBiOuUKaDvix84t4Fj7JTrd2qiA3YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672123;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=CoGiOw8XzRlY9JmCBE+2QhXOnMUo7m2r79WkdfI68V0=;
	b=g5voYL92F6KbKZ4W1xkQgPPI8wTiwL7369sIDd68rRBzDgPT/G4L2uDcEykX7QaoAXbd
	 CNLvZJMFM7AF3+XxscEtgaXrLkuZgdyS0e6XXCusvvG0O1daLvs+Na/QHRKMp1sh6iRkZ
	 No6hoZ1t2pJ5aryP8qsjva9+4j/mlDLizAq8x13f1ir513ssvEZiIoGJtkOlUFXpZN9g4
	 mpyUdyOuOg0wWAtkHzBcfQAekqQ2fIGrHS6fHKWvYCOONilfB6wNouppjVFqlcNw5/IDg
	 COBW9HWc5GusaOY9uM1S9880iBmYKvMpJ17RAO/SmVBoYbZ6pcUF0+OwEzK4ZgboIBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=g7vMXoS8;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1B1606A327
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 16:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F1B1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=g7vMXoS8
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id SBUJxqLBRAR1iSGCYxO2mV; Sat, 14 Nov 2026 16:02:02 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SGCYxveWaYskhSGCYxYLgc; Sat, 14 Nov 2026 16:02:02 +0000
X-Authority-Analysis: v=2.4 cv=CKMqXQrD c=1 sm=1 tr=0 ts=6af885fa
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=qV-KmSIps9gYX3opvWgA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CoGiOw8XzRlY9JmCBE+2QhXOnMUo7m2r79WkdfI68V0=; b=g7vMXoS8UBqxOeclArQeJtm4fG
	0C2BorjeoD/F8wTRd4gGiWKVLqQN7dWBH1ZO2DErwpcifcn6kc+NbtT7ZneSZsYkEFtOka8Hccqhm
	dNCPTp1I8VnV7H3gbbPIur6b9YM+BSatnpVKAVViYgMg8JUD0EXYzQ2ZlD4xj/T63MDG7IqSCZgZB
	Ico82P565spguA6i0fIKzFJddwyrZy0K3OLi2AhhYJGo84n3ZuaXTkVGGSScexxrxdWCNlhj1LyPc
	3o232mtIpPP+A346u4/vlNn52yIBctoBmWkysFUnlfMGp19BZX+vf37O+Sz9VnhvOcz/UGJWBgF6X
	5oTfvFNw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:37662 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSGCX-000000000fw-3MtN;
	Sat, 14 Nov 2026 21:32:01 +0530
Date: Sat, 14 Nov 2026 08:02:00 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tomasz Bojanowski <tomasz@bojanowski.me>
Cc: linux-hwmon@vger.kernel.org,
	Hamza Mahfooz <someguy@effective-light.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (nct6683) Factor out the NCT6687D-R fan
 configuration transaction
Message-ID: <025a9d1c-a29d-466a-b1b7-c3bab3077984@roeck-us.net>
References: <20261109223442.509238-1-tomasz@bojanowski.me>
 <20261109223442.509238-2-tomasz@bojanowski.me>
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
In-Reply-To: <20261109223442.509238-2-tomasz@bojanowski.me>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSGCX-000000000fw-3MtN
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:37662
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 7
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOBHvuLiDEdtkVxzAwCDBVbaKAYu9BJN9bIxN0fsNBZhzDfvx6tS1ySTQZG4/PHs/uJ12cZWg6/rxBaGCA1XNiZ1NB1WuXCUCmOQOojTeL8bPU6sYKz2
 7cvwQPdFmFOawLIXM7xYcAtUbBSFTsaGKRFQ8hZXBdqFssXnyW5vag3BV5QCyHu/rXbm1B0yw68iFXa1umuk3hqPMs2lc0ckxauFTXERYKGTtW11Jy1diTp2

On Mon, Nov 09, 2026 at 11:34:41PM +0100, Tomasz Bojanowski wrote:
> Move the configuration phase and its retries out of
> nct6683_fan_ctrl_update() into a helper which calls back for the
> register writes, so that the next patch can use it for writing the fan
> curves.
> 
> No functional change: the EC accesses and the returned errors are the
> same.
> 
> Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>

Applied.

Thanks,
Guenter
