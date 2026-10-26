Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974011;
	b=42TTG4k+Nxx6tzHMH+iIaZMHmqrEoqdg92PUBQ0ZSfLbJgSPGhq1Cz0DJ/2acyqfqjR+
	 V5cwSQ5vxLx0Al81xsb5oxxwGJ25gaPBIptD8ZgBFLziUi2N4edovyfoYGcIugyM/l3gt
	 M7yMYI1W4BE2mNc3tRPfS8WUPbpNU81yL2ZlW0VzyR8I24JA0lDnHOurqXZyXkR4fbjSV
	 0Y+WSY6HItorM6DpAEfccbp64b1vKIoHrAl1k9nB13dPMXDaG0jF2TymnSlQdvBsyLJLD
	 YzZNMuyPJnd5tYF01xsKKuY1osk2QGaRUQkuMLfxlUo+UHU2TELfIqFbTKChVGs9fsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=lJk5MOLydIzjQOgGx/lqDh+M3wd1cLnQSwja/ynaVP4=;
	b=y80a7eXxEdNFniGzsg/u2Fa0J54+cLi96JZscE/bwXerRxsqQSffwTFFFtlrRGH+l4A/
	 5vZprev/qL8fFLoY0KCM/yiP1KM3vt5noC4Hwie51o4MPRQYmvjkI98a6WmeDQRNOiNC6
	 MhUArJF1lzWVgW87guVTNWJkjfOTvdynCaWFsw+ph7QDIRAf42VKJvt7yhngSUaTz3x5y
	 KIBdQl9LIqW8hkDm2d7vJLZyqHvUxqm36Kou67Ja6g6GeDqhzk+qBvoy+Z1e/CsTkbeQy
	 eMyGpzYGBNJwgw/80vqSyGP4kDssbCzbcuWOMC1RL/DJBa7QVMz0ghp11DAkkFLuugg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eRnUr89E;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3337B606A31B
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 00:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3337B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eRnUr89E
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e98798cbddso8721515ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 17:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974007; x=1793578807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lJk5MOLydIzjQOgGx/lqDh+M3wd1cLnQSwja/ynaVP4=;
        b=eRnUr89E1tjfR/LxuxtyoX6EFK+rxjHZZCw2kLZGz5iagVOG6gW+YvNGCGXIJAdtKz
         t/eXz5W0ycDlTBW7cZBAzaZinhd2JZaXnPngzlrpxtrVlRSxJGjBDEo7meg8+G7sUPHE
         Kol9/EPzWK2nH9EzfWhyaS/aVzZoMU/MVbyGCxPPR9OW83HjGIrEA5FQzlb/gE+M68yz
         5Jbc0I3JwymjeHupPEqPxrzNjb1wN1hY2jyCJIFpbQVsZ+Ba39y0bi+sx4ZqNleczN/5
         lRhQfNIoe47QlT24yVsJ1ELBXCnpZ4IYAHKsI3c+VPvaU8/kWPHzycVBUokpDho5QkOv
         heMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974007; x=1793578807;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lJk5MOLydIzjQOgGx/lqDh+M3wd1cLnQSwja/ynaVP4=;
        b=CSa48U1SQXt0yNg5TQUOQU3SS89X4vAS+oofLUZfnX3b6b+FvupnViQLVDcrbDj+IG
         J1qzgvvpAVy53eN4BOSEGSXvVcNmVtorsag8qR5NDcUcFvSPYfsUAy3o8JK+FcUDahB2
         nKx02VY1hxCTOGxPlIVnN/dzAcUsiYv4XogVRR/w7LVNsY2T5aXN1BtKNNwvKhTK1smk
         7NPYz/S9k5Xixli06C2XSnp7c4/wluSnSrdG7dm0nDFYZW2tUmH75+46abk7RliGb5zY
         zXmcRVQL9lOFUkRuMxLKR5Fz5HmhyRHpWLQw70MuReVT0AHSIb9gQli9GYCcuQrjy0UL
         NLsw==
X-Gm-Message-State: AFq9FYI+GIFQXFheBitOFxG/+BmK1/IZ1Gzyugjf8/VAzSRagc2+Zeh+
	DgadXp734o3ogr+2wy6XydcXvgwvmtPUFuQI5RloWbTYxhwFBTP/Pyci
X-Gm-Gg: AYBFou2cRg4gk85S4oLLyI8FKblEQmu3hBYjUm/dbsbKRo/gBATu5QtDVzIwgJJwci8
	9qFiJEY+dF4HG85M7cgZphoClktOWkZqM7Jn9E5dZReUTGBlKPt3NfS0qKzdoAmBcUTmIpo67gg
	6Ge379S/mgJ1CbhGJc0fD1DBpy5nUmLdLkKXJj7FPLSKBf9P5NJgvdfIrOVxLwyttB2INkO6TnN
	hRSI9HlOvG7Kd7trHH11Vd6EJdtMfD0mdsFfKCgeqesb6cdSzpIRRq4BK1s7uD0Z3M5GHBW9geZ
	01dYSTmyd1M4FVKXfq9jJOCEpAMpBl4lY0tbITMHD93zRHQAOMkuXHl2Bm8RvZdxXJDQ/UDzthH
	0PMP0dDvKbNC4E61j+rfSg/7zU8M32JysJ4fjILQ6LN0SfYHh5FKI+YzShyJQHQmETECxJYzpYD
	cuwvlBbxv7mE3JHBk3lRmIu1VYP1DitV313AAKyAtWKaWJdzIT118/uy4oN3cw+Tlxsx7f5gVyD
	K9xNyDws/9bCdiBFqdjRc1tO8+83Us7ADbXRQgOIVrA6xrf9t12EPtOdOFafEiP8GZOnbK2lO7s
	0Y5o/3f5GmPRj2o=
X-Received: by 2002:a17:902:d486:b0:2e3:1776:278f with SMTP id d9443c01a7336-2ea9c876327mr45145265ad.42.1792974007573;
        Sun, 25 Oct 2026 17:20:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b121725sm9686325ad.14.2026.10.25.17.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:20:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:20:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH v3] hwmon: (sht15) Stop deferred work before releasing
 its resources
Message-ID: <4b1e8242-bb8c-4f4b-9813-c835f705a258@roeck-us.net>
References: <20261024014044.27853-1-mhun512@gmail.com>
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
In-Reply-To: <20261024014044.27853-1-mhun512@gmail.com>

On Fri, Oct 23, 2026 at 09:40:44PM -0400, Myeonghun Pak wrote:
> The IRQ handler and regulator notifier can leave work pending after a
> measurement or notification completes. Neither work item is drained before
> its resources are released on removal or probe failure.
> 
> Disable read_work before freeing the IRQ, since the worker can re-enable
> it. Use request_irq()/free_irq() for explicit teardown. Unregister the
> regulator notifier before cancelling update_supply_work and disabling the
> regulator. Apply the same ordering to probe failures.
> 
> Fixes: 251eb40f5ccd ("hwmon: sht15 humidity sensor driver")
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Applied.

Thanks,
Guenter
