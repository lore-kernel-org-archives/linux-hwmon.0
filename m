Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672746;
	b=QUNYFQFOFcimvflkkkYhoDQjHRANsBrtxz1/Q+4kQ19zkesMxxx91NNy1A3daCEd9AuB
	 dhVORclotZgrAC7IAJp51oOwtYJ1Hyu3D4yAwJwNg7VKFH3U1OjSrI1D4dZ6ahGyESmOE
	 57MI+VdfVyZXHiK76DuvvW3sVxaDwe92j4ZMS9xjJYqbXDr3DboYwW7T0H4M0qYRn3XaG
	 0q0bdbG16UJ+M1dvXPFWCxth2iVYAYnnb2Tu8Ly3u5vD/FZIPpL6I4qJ+r+C3oHKIW0MH
	 HctkTeKS3h3PnPduRNxC9dVNClG5GhDGvvYcB3AG+v3ZlSwmmPHQI06oiFkd1IxSGfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672746;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=kEkaOkQeMRnw0qsEq0xRjd68izOmTMA95HqnllOLAvU=;
	b=5sG4lMZ/PflKudQwOEctb9eWACijJLxGtKlkBInP53rlodeplt/qo/4atVJcM1i5kqN0
	 rzPhNxGhHhTjKc5nXDym0jUBh08PV/sr2NmlWgxJ+6BeFAIrP0Kz3p5DCScM4g9J5r5CA
	 fxqpHoa357GifrEgF33oaVabC8U3Nm/Ar6X3/Htk5SQKm9BKYWHz5RZbqk5/2d84323Ul
	 o0T3aWQPkH0A57Ul5Qcy1y5wgr7LSP2qozfo69+16hbPIvGuie9dBf0hm2+eSpq0Zy38j
	 I11VY2uUKYwtd8Cx6fP4u8nvmaihNIT36IYdhgi+CR+toPCBwFiKBNIhVLWxv8boCWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=pixxEMe0;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA7F606A89D
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 16:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FA7F606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=pixxEMe0
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id SEJUxHaoX4vCDSGMbx0Jhf; Sat, 14 Nov 2026 16:12:25 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SGMax0ADxuJrPSGMbxkzBh; Sat, 14 Nov 2026 16:12:25 +0000
X-Authority-Analysis: v=2.4 cv=WLZ/XmsR c=1 sm=1 tr=0 ts=6af88869
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=75qNvS0j-qH1rC7vJqMA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kEkaOkQeMRnw0qsEq0xRjd68izOmTMA95HqnllOLAvU=; b=pixxEMe0oEBrefPWo/zb3UNgB9
	Ta1Xy8J2IszyJ2D//YXV2XeT63xUijZB8kf+M/PKw/7lwqrP+CM/kTjG3XRAhGEh/MrxjVTd6zDkl
	dOuxj9rQFzDWAVmIln3JOhFRLndvVpPmxlbZKw00dPqCuAvXjJ0BMWuJZ1i/7PmSfcvlIozxiWjmR
	ygSeZUOgZFQO6Xwt50qpjC0Oz3zawZ327YBd3BRdEKxv6Ncu2XvhvevgGXPBigl0oPhAOAb90CZpF
	PQWtKN1KeRAwt5agKrGhLTkLGJYwaB1cvREmUrW2ZvTKGLvgnM0uykvelz642N5FZbC3G1IR9Mngh
	LJHq/aEg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:59218 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSGMa-000000005tf-2e7B;
	Sat, 14 Nov 2026 21:42:24 +0530
Date: Sat, 14 Nov 2026 08:12:24 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Johan Dahlin <jdahlin@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alwyn Kik <alwyn@kik.pw>, Fabio Baltieri <fabio.baltieri@gmail.com>,
	Hamza Mahfooz <someguy@effective-light.com>
Subject: Re: [PATCH v2 3/7] hwmon: (nct6683) Enable fan control on ASRock
 B850 Steel Legend WiFi
Message-ID: <46e5e765-661f-48e1-841c-e2e2ec4dc0f3@roeck-us.net>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
 <20261111082838.1418051-4-jdahlin@gmail.com>
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
In-Reply-To: <20261111082838.1418051-4-jdahlin@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSGMa-000000005tf-2e7B
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:59218
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 39
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPnCqXPaR7buiH5OqLuPkFJtTCziCL1l1nl/nnsq9cR+2w8aYAj6Z7tEvobIImnRR2zMlZJXRXWaGaZE7IU/RWN1AQxZntru2q54HYsFb51Pl4wbcxSG
 jcgaimXhnzbDgajx2WxntO76yc5If8Po+bqhvX7B0tXu/mK4Kg/bb74ZlmL6uTyOTuqNRRDRfBRpanX7YwU2lztrQebaUM8xdm5gWj0jI/vOxFiYjTYwILc7

On Wed, Nov 11, 2026 at 09:28:34AM +0100, Johan Dahlin wrote:
> The NCT6686D on the ASRock B850 Steel Legend WiFi (customer ID 0x164a)
> uses the same fan mode register and configuration phase as the NCT6687D-R
> on MSI boards.
> 
> Enable fan control for channels 0 to 7 on this board.
> 
> Tested with pwm6_enable set to 1: pwm6 written as 255, 120 and 60 gives
> 803, 577 and 342 RPM on fan6. Writing 2 returns the fan to the BIOS
> curve, and so does unloading the driver.
> 
> Signed-off-by: Johan Dahlin <jdahlin@gmail.com>

Applied.

Thanks,
Guenter
