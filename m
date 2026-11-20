Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202808;
	b=pNePaDc6OzIs9NglSfd/xUCUhvUG2pJunaUw4v1WtCju2yBeMSm/iRc+OhqvJeW2QAcL
	 fSgHETnVjnSJiLlZLaAVe4g8ZWfU2u0FCfLzHRcC0rVmtUr4IoeD9FshPRBkXdl8PELZt
	 RPeL1kSboC+G+MPxhpu390Bc5qe/bStRRo1+q/iZ7Vrr6txTPT8vl7vAJi8pTIJBW/cWT
	 /C12oDBeVTCdAj5E9fVu3HMo3yOqsgFNrgOKdocOTz0myeQvpKdlKiyiKl76/b+/Gm+37
	 04DFuo25qPZ+him40kfLOHf8sTaTluA7ic+wVENRHiPtIB6Jl0AeZwtK4QSwYtBOLJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202808;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=UvDSuM79TWfXjAkn3fS8sBwy1fiLVat/Af272vaPaR4=;
	b=symlKqOGFJSvwRIKLG9fHfT61jkiVGbyk1Ehahm1cG8y1OF1bGtk4txIxk1c4CRosjWO
	 tu60dbFTX4o+mY9J0h4+Jh00ZiGMKt5sQX/AW97FJJ3juC2Xkdt3TowVoqsHiR9wk868t
	 0QUg94TNo8f5pdZSzmIZkKDtiECwxXAVfjju3EN1XvGXdYaMVL0D9czhSJdUUMt4ZJwVf
	 O211JezVqq9Ma/cnobvJK5TzpvE0Zs4PjAUN7RB/mvONoazCOIn/dbFkYD2PwkQ8p5MyK
	 26nf1iqUeZ8Ehh4xeXw6kGckqsQ98t0vMts14Ct1d8GKYl8kMmMvkjvVy4UROPv8DqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=XhKNjbuJ;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28721606A6E7
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Nov 2026 19:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28721606A6E7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=XhKNjbuJ
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id UP9nxidhERiNxUUFyx5K6t; Fri, 20 Nov 2026 19:26:47 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id UUFyxL2dxSgq1UUFyxQdoH; Fri, 20 Nov 2026 19:26:46 +0000
X-Authority-Analysis: v=2.4 cv=c8KrQQ9l c=1 sm=1 tr=0 ts=6b009ef6
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=4rZXt00JAAAA:8
 a=a_U1oVfrAAAA:8 a=D2J2WBqTquadeuaTaOcA:9 a=CjuIK1q_8ugA:10
 a=7uy_MM2TgZVoQAy_xcjM:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UvDSuM79TWfXjAkn3fS8sBwy1fiLVat/Af272vaPaR4=; b=XhKNjbuJ+j6yHCXUNo5Z3PDPlz
	cijDWBBvmPL/hEiHQW6w5b/ZUFtTjiQU/lzZhq/dgpXoyl0qc5Fp8HfE7RiinQrZd795VOvNbf4FF
	oplMGJxxEArmMq5V9G1tjUXxDDOpiGK9Xe6MDJfdhEr2QXzffOFFPe2HMYbDsHnkSHAvRz1ObSckf
	jsItTiDij57UfmImP1HqbrOhL6X7IjhguFY6tmehGwr9NwjhBDQdOR3qFtTpD81W390nEHyvumkLB
	hx2mqNjfJUbrudAUK3DtQL3XJwzDCNIQ2XVSSLgrvVkc42jnbOWWaFE7452yQ0Ne5X57H3Ozq8WzL
	C9eYSNGw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:37162 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xUUFy-00000001WlT-04X2;
	Sat, 21 Nov 2026 00:56:46 +0530
Date: Fri, 20 Nov 2026 11:26:45 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4 1/2] hwmon: simatic-ipc-ec-sensors: add BX-54A EC
 driver
Message-ID: <fb4d5df6-4bd3-4ba7-9c89-f76d9365652a@roeck-us.net>
References: <20261119174548.1324539-1-benedikt.niedermayr@siemens.com>
 <20261119174548.1324539-2-benedikt.niedermayr@siemens.com>
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
In-Reply-To: <20261119174548.1324539-2-benedikt.niedermayr@siemens.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xUUFy-00000001WlT-04X2
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:37162
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 11
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFi16x4guBfy18uXZeS26Vvwr8cgz4ro02Jrk6Jmrmb4zTT+rn0vTmUTnKkiU91iAoNhwxCj/QJ3s8s/V+hUuWny4qfPXfsI/s8hSPYEYBhsARMf/JWs
 kLwstCbq+HmDS51Isz6GYj715uVl3P8VsQiILniwd8yt+UOs8tFz5fYPUZCIvOVeRpMjzCgxSVcA6ccr1AAxPN4p+CI3BLr2sE8x81KYjBT+UEZNEM6t6fGI

On Thu, Nov 19, 2026 at 06:45:47PM +0100, Benedikt Niedermayr wrote:
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

Applied.

Thanks,
Guenter
