Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857215;
	b=hpExLTK5XXvXz8pzz1qqikPPVumweyc9x0q+o5RfBePeEXcotht9v/1wij4cmWzZO9/G
	 W8e24tagZMKFiNRbVsu75BLTKfsEJaig8Gps9JiPwtG8OzUcVwJwsi0adopoSksnRRIyh
	 MTQtF1aJ7MRV6eGG5eMb6U8NkVcXz6jaPettXld3JdXVkKr0nw9KbXo8EOoT8N/nS9RRb
	 9Lr9SR6ykcRHVhDxcYeSQfMU49XBeatQraKfDKVs9c/da+KTSMmy4AoRKAEoGa3xjpWmF
	 IsPMJAI3xDW7p0tlctHADWXbbkFxnndaFAjiLOAFZ8KW7T0ZZ/3kFmwio5HmSoh3fNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857215;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:X-Source:
	 X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=IyXavZCsJO8DHJmxq796s3KiTcfdivwHJjL6XAijKZM=;
	b=owEHzSdfq+fqUrNmUg28kB7z4EwO71VRDq9oMxX8YluZ2BVCM2NvC5uUczxywJPMY9xh
	 vo9LfdtqV8C/S9CvvA3InsSpCVpnnBOZr57JX32uu1+AQ3dYlCL3wLxJmpOdMOu0Ia5Rg
	 ECTp4+tyq9NTVAXsI4wr8poXqGxZXvwQ4oh5d+/RJxFULn412cmQgRI6K4ltDXIrdWMXC
	 h7J0yfd98S95aab77IzAnqDkgApUlaCQ0ifCD16X04FlGPBLInejXvcCyf+xK9ViavZpQ
	 Ly8GBBg6mzIzz3/rIQD00cwriUsxvHVf9LFpqfXaT2m1buVN3dNjXcuVBJgHZ/PNtRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=0UHLp60W;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFD4606A8A2
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 19:26:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFFD4606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=0UHLp60W
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id SugHxi8zPOOJnT2Ltx9QCe; Mon, 16 Nov 2026 19:26:53 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id T2LsxgYfF3nNNT2Lsx29Xz; Mon, 16 Nov 2026 19:26:53 +0000
X-Authority-Analysis: v=2.4 cv=TuLmhCXh c=1 sm=1 tr=0 ts=6afb58fd
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=IpJZQVW2AAAA:8
 a=2bteIYZuzBj_oPBnypAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IawgGOuG5U0WyFbmm1f5:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=IyXavZCsJO8DHJmxq796s3KiTcfdivwHJjL6XAijKZM=; b=0UHLp60WQIVA
	ISPv/Z+pQlcXUU6yUS9Z8/exmFUQbFEpUq5x4yPaZAT+QctuyX2C+O7RzS0gw8/f8jKo/amYQao/M
	svGHkOHu6fHZBXRo7TYVEX8c9RELkXa7Iu+1+1b8cEfjTERHbe4sl1yMMpD8nuJwBwYh4TeWPZxih
	Xpc72wicV24A8OyYqcF05TgOFA8BQN2qGGsFiXFFgAk3sA2EhQ9ehM75myAGElFan+fsodvBGC3YB
	bcs6dELxWf9tGRL7ijcvdbmiCdIGIw/PXbNqXVaJ2NXX4dFRfX4cwLfO6JGKtScRC/DfG3LpXf6l2
	+K5fWSFeXoDxtHFtoLqHNQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40034 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xT2Ls-00000001m6I-1U2o;
	Tue, 17 Nov 2026 00:56:52 +0530
Date: Mon, 16 Nov 2026 11:26:51 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (ltc2947) Make ltc2947.h self-contained
Message-ID: <5c2f14c5-1313-41a3-8655-d9a3ae97d9a2@roeck-us.net>
References: <20261116180950.3894659-2-u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261116180950.3894659-2-u.kleine-koenig@baylibre.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xT2Ls-00000001m6I-1U2o
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:40034
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 4
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHrK8tikftIWYmUKCHM8+qaMwWWOrxVXXpg4rWQRayLoHgajebYx/kbrCgkWql+v5ESMHfSU86w8gf0CmpvdZjv+6H+smoBLcFPMHFSAuBQmyH6HfVAo
 qQ/57dQrJM57Qs1eb7FprXir5PKXBbpY2CvXdd2jBS4RD0HMcfN4UWNTKHe6xEEtry4kPIAg15ev37jnlr7BALnSgzd85m22BGL7TJZK474vbdMX4J+o6M2/

On Mon, Nov 16, 2026 at 07:09:50PM +0100, Uwe Kleine-König wrote:
> When ltc2947.h is included without a previous definition of
> of_device_id, the compiler wails:
> 
> 	drivers/hwmon/ltc2947.h:11:34: error: array type has incomplete element type ‘struct of_device_id’
> 	   11 | extern const struct of_device_id ltc2947_of_match[];
> 	      |                                  ^~~~~~~~~~~~~~~~
> 
> A forward declaration is not enough to fix that, so include the header
> providing `struct of_device_id`.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/ltc2947.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> 
> base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
> 
> diff --git a/drivers/hwmon/ltc2947.h b/drivers/hwmon/ltc2947.h
> index 5b8ff81a3dba..eb3613f4d4cd 100644
> --- a/drivers/hwmon/ltc2947.h
> +++ b/drivers/hwmon/ltc2947.h
> @@ -2,6 +2,8 @@
>  #ifndef _LINUX_LTC2947_H
>  #define _LINUX_LTC2947_H
>  
> +#include <linux/device-id/of.h>
> +
>  struct regmap;
>  
>  extern const struct of_device_id ltc2947_of_match[];
