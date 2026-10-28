Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203784;
	b=AhvqlSW5/ybbQMg+hQIWdYBIQRJ6+6N/Q7BTMh3wwns6CZFUfRPBpbHqsXfFj+xMW+ET
	 mNUzToU18skBXrFTFrRdjSRJ5bnKlR9Gm96MAnmt5J7wZhmIxrsAhENIgC8pwTeIyCz8H
	 uIDc39AUJJrWlsPwmbcaW0+DGjLnKMzXSuoeTBTLrBL0tkU91lusBJ4tq1IGwC7rteZFP
	 0XSziTx/hA5a2fqRkRiM0KlZ4kiFTwXmSBHx6d/qFPwwOgcUatvi2mg6uGof7uy1BmaQe
	 ZF90Bm1+DLIT0tz/ZmVDkeeqlV3t7yeX6buoV6XyViv041HISylAn+OkCyEmpwVECXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=YZcts4qcYFLKUzeEZmCB29OAtaKV7wlY2duix3l+9sA=;
	b=jekcAb7wbplZUyiP+Lzz9NLjoSTLguO5DeYpXdswhkLVrw1Jp5JiYs4Dy3SbsIG2Qud3
	 jCcURHR1D2afiFKS9ruojK+wzXnxOjP0d1J7ZBWilacDIuBVGO1uI+hHBZlNH2o447DN7
	 4eOv9tMmBeXIayc893hNkv8J1s+F/gynwVbB4T0/oBS66AJmco3/nRO5pJzqFEGE/ri3G
	 mr699TTyprxVqIzYAIE05C/FkMF2tMesiiZr5pXAVrTjAaAMRx1dSLqE+ih4FxnjRsj1Z
	 wojhrWB8Izu14vpCxlnn0/qA1TYaa2S27dwgiC8vK5cl/TNVymD6CjpVQa0COq+Mp9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ji5Xvtpo;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B732E606A32E
	for <linux-hwmon@vger.kernel.org>; Wed, 28 Oct 2026 16:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B732E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ji5Xvtpo
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1033170f8f.2
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Oct 2026 09:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793203782; x=1793808582; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YZcts4qcYFLKUzeEZmCB29OAtaKV7wlY2duix3l+9sA=;
        b=Ji5Xvtpoxyb8kVn4SdVY2cX+DsEgu1bKkZdsC3ebjs4d1+CltzAuRtjoP6qRorAjmm
         U/OTale8tpuOeROnVeyxXNIIaWfog47eEJFCNp27SbEPsWiXlbJSFUU7KgmL/w+kS1Qk
         Xoz40ZBJl6WRqwF7cZjV6sWb8IbzqZcrFctXWKFMXwrZRtrx0RyDRwjEA32GAPhICZjW
         MQaQxgB9raqsmYBxkaP7PzkQnI5sX89vYUiv0DZuFdVs9fh4gndC7Z/ZAgGohdQcpiRV
         +IlqliYlhUTo7YEUzaeGWGEgvu/pIVHVtE9NKkTWWWXdySGqcXDMlZXy58QAKS+slkSX
         voyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203782; x=1793808582;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YZcts4qcYFLKUzeEZmCB29OAtaKV7wlY2duix3l+9sA=;
        b=oy95na1ZLxka0cDdX9cr8WHkKmqQvas7cUBtRGBRBGVpePhSiDnXp0NpXQqOFT3+4G
         BNyorBMoJQNuzrQN5hBuIihkqRAGZuSVZo6aJZ70wk4ioyJNKxVKz/of1o50IkDeNl1A
         pDwjfTB83KVzdBEbVhNgbQ4flR1cvTSnTXU85rPoDt9AtPpIliYVT6GcPBuLmnqFx5RB
         8CJQLLOPEF5ev6lAkfHLg20rt1Jcn//puGwuaiFF8dKAhzomO1fKv/xR3DjvYMT9xlek
         ArIHUMQ7YcfRvbpR1C8mGtBPFpu3ZKaJgugVhFKJX+rz+FZzBN15djuqrcsdpJGedtX1
         e19w==
X-Forwarded-Encrypted: i=1; AKwUvBx4Crjjmp+xcJrZ5V32fcjgffXhDWNa2RWgmAlCHEawwQi2vEAUH8axBELiwP2aRXZmSnEL6bJ0dJv8Sg==@vger.kernel.org
X-Gm-Message-State: AFq9FYINR75wFYsjFCvuyBF0cxgO41rvUp6U+aDBpQF0lKh6or7TUHJk
	oVbs7osm74WASxmZAz/ISlrw6m8/jH4K0vfC7vmplEVkq8JsGp2FXwCthNI1ocVZ+wE=
X-Gm-Gg: AYBFou2+p5H9QX1sGm/Ga5yNaXgEW1yjGu4fpoYYyTt+dHf7Wxg1QvUWKNoMAQBUl1H
	TkE3RBs3Fd1CS6dcwUahth0bCUPfQ+Tjw5l/OXENFXaroOytPSEeiXqVwfSZIRuiMHWtgKSTmhI
	MErQs77gc3ogYj35mFnrL5MuZS8SWWa17GpGTwvg3sHiVD8VOqp9TZ8v6mS2cnOcUaSKziLSGPP
	T2VLz9b4B4lRwZp3DdHRc+PrtjspcboiT+I7ivx6ndqQpemCJ6qTmASDKOvrWm7P5xG5w4dwaql
	qT3ymvGOg562eWexjRX317RGf35ER3AUgw2436VIeh4eoVW0DrvGg0GM3n13lO7MjuTVEv+NZPi
	g9yrd+prv50HpJsENAr9y8vueKi5cv8LphmFmjCIPDj7++Y1I/jFLGk6IXCNyqJXitz3NpzLQFl
	Lg8/u6AU+1h8ZnybMq67f8ZaageMpYTL5QY2sMHF2oJuJ0/8by/nE236s8TOIARI4xXuBA44Wip
	5rrYBRXHldK8SznfyPXg/Tii2HoiOMifZeim477hJXnRiBmkbF/a1gwSmte8DlYNjXmDuQ5ZlG1
	nh581x+DmHqVn0IOeG5Mrot49MoihA==
X-Received: by 2002:a05:600c:4f89:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4a966c41836mr68052215e9.19.1793203782221;
        Wed, 28 Oct 2026 09:09:42 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa8213ead6sm1572025e9.14.2026.10.28.09.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:09:41 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 28 Oct 2026 17:13:35 +0100
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH RFC 3/4] hwmon: Add driver for Raspberry Pi RP1 fan
 tachometer
Message-ID: <auIfL4ZGdfNDUZxO@apocalypse>
References: <cover.1792748690.git.andrea.porta@suse.com>
 <0d2249a66732bfce38a2260bee08cd1ba4097e51.1792748690.git.andrea.porta@suse.com>
 <auGdsv0OVG4iLjZV@monoceros>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auGdsv0OVG4iLjZV@monoceros>

On 08:02 Wed 28 Oct     , Uwe Kleine-König wrote:
> On Fri, Oct 23, 2026 at 12:15:56PM +0200, Andrea della Porta wrote:
> > +#include <linux/platform_device.h>
> > +#include <linux/mod_devicetable.h>
> 
> Irrespective of how this patch set evolves: Please don't add new
> includes for <linux/mod_devicetable.h>. <linux/platform_device.h>
> already provides of_device_id without introducing a batch of unneeded
> dependencies.

Ack.

> 
> Best regards
> Uwe


