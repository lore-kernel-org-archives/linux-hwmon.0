Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975707;
	b=xeCr1boSHGrgEA3mUjcjNUhyBXXqkQGOdLuPyGL/6vjx7f3ncXS1+VIxjbk3YtYAUo9W
	 VRD+9fBvwCngm71+hAMozDRAHcWTwchSLt2cJMlpg89o+OVOaXQE5Z3u0XhHrMeYsTCW2
	 uDvRSQg2YS2fMpbL9Jq711eLia5mtcUCr7YLMlQ5j1ODJNODXq1TDB9KjrB+EOFWXnbCB
	 Gf75ltBcBZSpJCKe8MJCB83JEDx9ghf7UxF6RjkkMOcEtu23Rl+2idNrhqF5aCSg5/4su
	 xloejlsj6+6yrnjiJxkQ6uv7SQIQu5XeKv1RYDqkjH72PYeoypvxa8Uq7A9WJdU/MUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975707;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=bQddz//YMjfAi/F5HCCAYzhDePcar7U/d0RK96g+D68=;
	b=lKTbFeaxlx7uhZxjINGwMehZSGKtn/1mkocWdMJ/ymliszo8EOB8vsb0cCLsPP6Zm4fL
	 ZZEkJbLh3stsC+Vwv9FFvC9c9Q8qbftRYnblRZOvIvNDfTWzK46Xtd9kveilKmzcFEsF3
	 5Ynh5XiMMK1H8X7TAvAUTjlTJNQvyMT7dbIJ9EWPN7Xe0DDkhO85FNCgZrJx1gJ4tXvZT
	 Tu7gf5ClHfzTyEg5to/nnttQuYiIXKLA6BtyYBX31IPso/N8xPcNqMRMQT5aJn2wCA8Is
	 R1fY5kXRO25/tRQr9d9VBEiTdZoG4rqC6lTk7kclP0WZp8UyUCdLGouY0zeF1dOAZFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=rMOkA+9V;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D015606A31C
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 04:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D015606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=rMOkA+9V
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id TTzFxuJ5Jyb4YTXB4x8Vad; Wed, 18 Nov 2026 04:21:46 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id TXB3xzsb4dRrRTXB4xxG0p; Wed, 18 Nov 2026 04:21:46 +0000
X-Authority-Analysis: v=2.4 cv=LOhmQIW9 c=1 sm=1 tr=0 ts=6afd27da
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=tTf-FdDYpqwTFT_ZJ6EA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bQddz//YMjfAi/F5HCCAYzhDePcar7U/d0RK96g+D68=; b=rMOkA+9VMvNBXoDDlBF0IIYZbY
	go/Rt0OCWqPD4F4/WQGOfpzM/OMCjJkd2ZI0mQa6PozuHq1KgmPCvsKKJupQCTlETpAjtrl5Gr251
	bWRi4gCR6itNwP8Tr8EXtkrYPqc+luVzLzCq4/nPJSXUhpRxWTlvYRGHFQSbOX+kPOEjmhGIGk2HW
	50TxNuL2i3+yCX+aY1t9CyqHHpwArqPs69mo8OnZczL+bEPW1O/QEvmlsCIIKg7kfumxyc25nGz0d
	/DCuzT3h4QJQ1eeGJ5Q/E1owIRlU/mA6QUfq4VyEyX1UhLdVNeYxgbu5DrlEkTs4s5rxVFU/IEeRK
	jsPXLRSg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:50752 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xTXB3-00000004BMG-2D9Z;
	Wed, 18 Nov 2026 09:51:45 +0530
Date: Tue, 17 Nov 2026 20:21:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Rosen Penev <rosenp@gmail.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (dell-smm) Reject out-of-range pwm values
Message-ID: <d6a2831e-ca72-4dfa-bc4e-0470a67232f0@roeck-us.net>
References: <20261118040417.19049-1-rosenp@gmail.com>
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
In-Reply-To: <20261118040417.19049-1-rosenp@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xTXB3-00000004BMG-2D9Z
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:50752
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKem7UgNDe/F+0wRc3kXb9/kLk2BucOJ1iqs6SynUHQf5sdaxWpQ4wUigbgkknKMIQ1sbkDmDKJbmUdA8rWplOD7XS4Kgv4/BUWsLeN+21qW4Ra5huKw
 e+4QsvZAVI0snGlwbW5KP3b0hRGBmc0ANJ6UjZYmpRiNt44l94K9GL3Q/z+dPzb9jiwGbzI6dn/ntwRymEqo6vjc5H4LwvI+M9Qjo0v+phVym9lF9iHGujaG

On Tue, Nov 17, 2026 at 08:04:17PM -0800, Rosen Penev wrote:
> dell_smm_write() scales the value written to pwmN with
> 
> 	DIV_ROUND_CLOSEST(val, data->i8k_pwm_mult)
> 
> before clamping the result to the valid fan states. The rounding adds
> i8k_pwm_mult / 2 to val first, which overflows for values near
> LONG_MAX and wraps to a large negative number. That is then clamped to
> 0, so writing a huge value turns the fan off instead of running it at
> the highest speed. With the default fan_max of 2, writing any value
> from LONG_MAX - 63 up to LONG_MAX selects fan state 0.
> 
> The pwm range is well defined, so return -EINVAL for values outside
> 0 to 255, as is the convention for pwm attributes.
> 
> Fixes: e7f5f275c62a ("i8k: Implement hwmon based fan speed control")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied.

Thanks,
Guenter
