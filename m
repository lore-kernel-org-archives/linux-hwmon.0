Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.220.183.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793419916;
	b=x7K/wRZ+WEF9q5KYt6dIQVZmMAXPtvXae4CUir1VF9H+mJKVhhLhmqlUeJAfIHgScb8S
	 own5wzh5F7LGgE0XwdcAsNdK1vKadPKYBO3sWsj0K/rCmnvVnYfzGmmcqa6dP/2/kqAgc
	 Av5GtqQuAZp4/gyGUd+94zODBOgoRbr5w1mAb8Pqngal+ssPZMCUdT3WQth/0HNIzHpkp
	 N9wtCYhUeIixlewOQHjn3pwHsuwjHbI8ogyS8vkE/J3ad+H5v92p1yYsZvXWok8ktbgRc
	 J6ul4zohtLRlrrScmgev6agTt/pHT80DKXpKvyudgcFiZD2PJU165jvkDijJ75i1xBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793419916;
	h=DMARC-Filter:DKIM-Signature:X-Mailgun-Sid:Received:
	 X-Mailgun-Sending-Ip:Sender:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8ub9iXAoM4gCrBKvDxQM48WWoOu0RqxNCfUZFZZ0maQ=;
	b=qjQL6gF1enoyTo9cPpBqdsQ71zk3R6oAi2Zs95Sw9vh9g54k4aUnsBfpaVEBFcVzkY+e
	 9+qVwr9LrrhYM5/kFaZJhUFEAwePX5Upo3SZatRK4XzmnAnaP+ulqzPqoNIVpOU2lmfno
	 vcdXj622aVFBW4+0C4vkOFtmtpbzX0cmv1weoYtkzYUZGHdvakwlAs1ejouBJpVR4NpEm
	 Hq0twywC0XALdOvUTWveH3KWGwS1Dy3mqlVJy4wAOzeadsDuC078tnRCQzaEyn0EPMVi/
	 kIKNHri9lhJX0rqyWiGalZposVN8TK+8fv/PC7KMtnuialwLLXsT5IO4Vq6RDipV0pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=equiv.tech;
	spf=pass smtp.mailfrom=equiv.tech;
	dkim=pass header.d=equiv.tech header.i=@equiv.tech header.a=rsa-sha256 header.s=pdk2 header.b=OWZTGi6x;
	arc=none smtp.remote-ip=204.220.183.29
Received: from k29.k3ae2098.use4.send.mailgun.net (k29.k3ae2098.use4.send.mailgun.net [204.220.183.29])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 05942606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 04:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05942606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=equiv.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=equiv.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=equiv.tech header.i=@equiv.tech header.a=rsa-sha256 header.s=pdk2 header.b=OWZTGi6x
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt; s=pdk2; t=1793419914; x=1793427114;
 h=In-Reply-To: Content-Type: MIME-Version: References: Message-ID: Subject: Subject: Cc: To: To: From: From: Date: Sender: Sender;
 bh=8ub9iXAoM4gCrBKvDxQM48WWoOu0RqxNCfUZFZZ0maQ=;
 b=OWZTGi6xSQOO9E3jXSSVpHAPdAOMERM355O65vn9EqqvXZHjpa5Yt8gGkb8jPPChNv8mWBJdSoFhywHjMZF/xhOHd+Wt246TQoEpsmjvOUzeDIVTZPpRiNugIqlYVKQa6ceneTT3V/k/UWQXuW0msi2STcIspO8yQmZWD7LREgSOGUbVcI2sQudfIyjBnIR95dSfg/lUc7qa09TOujHkQF3ksSYNTJxFu2oAfxCd8iG/I/8wY6XUt/AmtQK0GAEwkTPJfOE2Ec4wKFBiyEaWJvk6gdCGOFXIIgnqZKonZEX9y/dPbuKzJdCNgNgnivvGUVhVrPCekBxjLeTAqyHH2A==
X-Mailgun-Sid: WyJkOWUwNSIsImxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZyIsIjkzZDVhYiJd
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by
 afd09166656e74796cbd20510b67901881205f48e1f12d9d62dd6e70695cdaa8 with SMTP id
 6ae56a8a8483004ea3897075 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 31 Oct 2026 04:11:54 GMT
X-Mailgun-Sending-Ip: 204.220.183.29
Sender: james@equiv.tech
Date: Fri, 30 Oct 2026 21:11:53 -0700
From: James Seo <james@equiv.tech>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 03/11] hwmon: (hp-wmi-sensors) Avoid global struct
 mutation
Message-ID: <auVqienKDznhrlls@equiv.tech>
References: <20261030185256.976255-1-linux@roeck-us.net>
 <20261030185256.976255-4-linux@roeck-us.net>
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
In-Reply-To: <20261030185256.976255-4-linux@roeck-us.net>

On Fri, Oct 30, 2026 at 11:52:48AM -0700, Guenter Roeck wrote:
> Allocate struct
> hwmon_chip_info as part of struct hp_wmi_sensors instead and initialize it
> in make_chip_info() to avoid mutating the global structure.
> 
> Fixes: 23902f98f8d4 ("hwmon: add HP WMI Sensors driver")
> Cc: James Seo <james@equiv.tech>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/hp-wmi-sensors.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
Acked-by: James Seo <james@equiv.tech> 
