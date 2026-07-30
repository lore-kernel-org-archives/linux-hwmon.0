Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A029538910F
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 16:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429023; cv=none; b=RR6t2PcP3ddvfa8JaPVk7JzxChitzviT/V4hCLE5071wEeJIIYbIASOWO4sKcJN/d5yCOC4P0KE3b6hhHc1seS4OEKxPJr+Z2KFVU9u7BrOEabyGEF9UY8AtRRfLG6ndNREhfRmiq2Ov4yzA+2yp/nG7AtSJ89bnWpKoblunbZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429023; c=relaxed/simple;
	bh=+7uiJy7c0mq/h2EZozzgTl0My66G0gGb/IGm//fPKk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gIG94jfo2FEShFY/ox1T6ptFpSGYB/p+g52tH9+aZOQII81RYdaS0tFpyh655SGfx5x1uFJPuNJv5qW7Z02+AIXwVjeC+Y1rNXWBSzlqBCubJ4MfcsK6iVn8tF/1tlHkSKizVtpBVGLH4MUA+fEIiCIBFo2JSgwBcRSd+C9NEkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLCVu0Gz; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLCVu0Gz"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2caea3f742bso28813345ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 09:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785429022; x=1786033822; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TS0nLpk02bjAFhrrV/3dEEPbrbUjFkBR6sFXFkMMfOo=;
        b=KLCVu0GzzNJF47mT5493OFY17QmauYqNArjZfO3bmuiBuUU3HUhUOnA23WJpm9H62e
         Maz1KC/dR+WHByz5WkFnkViNYvMhW11AXYXzqyYxXmGzhNrnEdKZ8ZhiWdJR6Od3cMIn
         DiZjQ1bASLzqqt9VQB0xG1oFCBexBSorR3qniQNvWXRlkyOGBxeX+t5+a0UE3B4Fa7io
         mxthzgXpGPPyGWWlvl+RFgKxKDjRI0ZcOErXNCXoAhHhQ9MoOOGPENnJGbCgWRTuNNdf
         ukljY6koN+QKvApN5kMduLeK7e9O/udcz2kfhRdd65vyFgIKLnf4eQQ07HBdrOWIpRxs
         6gsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429022; x=1786033822;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TS0nLpk02bjAFhrrV/3dEEPbrbUjFkBR6sFXFkMMfOo=;
        b=NEyy4rYpO1nMFULqCwub1ODFIYD+wghICFFXLgvZTu2U34RWLC1Z17974fJLVL7OQ5
         leNIMbcjMvH1SaE77xxgu4aS0882Fe8LR7IlAbMT8WZ2xuPLlQ34vbHs5qgBJmfCb21P
         6hrqjsRMRoh4ux8Z53eOup6Uh2i3DgWSVUmHhCbfIfJ8YjCi1mRYVjaVDFSwH7oGaCaa
         sOqj0+SWIJ8iVyOFz93k6xbK8WZBgLjefSvFxoinA7Yoe0dU/BNzS+LavONmKa27O0Eb
         I8Qw9hMVlk5CbU8Wo8w7L9lqrGIRzK0uuLawVLl6bAqUsvv6aebOs/SsZvIEzVHy9WSa
         4z4g==
X-Forwarded-Encrypted: i=1; AHgh+Rr35nhWz4KlGmIpentDiVbduHI+OA2OVobcuRhYx7uoOv5leXZvVwPAMyEwhwU0BdRsd+oFSxfN2NYezw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbEHHtUBNy/iLWxdUEDmvllGUYt77R0QcrbZPXmofQiI9EEhhH
	jwfU86sE5Upn1mIAl9sNvwcwFqb89GrKf89UiUuh8s7e6lLtIgJn3RAJ
X-Gm-Gg: AR+sD13bMmgJJ04D5eQYCXbI+KkcoDAW8yAOkA9kcO8awcq3l7ccv0VBh4tDOP7n8i2
	+QNuC3q5e5dsTPgd/pbxd0HL+DVal1CYiVk+IG8Q5TV+rPvVOJgHinIIs01jyk4PLKp5/9fO1CZ
	HECxx4AvQEW/Z2Mz8W98chPKc9carDgwHlBG9QsW6Ddkgja+rznkISLH+r9tZwvm7Bo4gU/qToy
	+4zLcCk1WlRaAuhxn1cvRhvsd5vnJXMLpV8dLoSCtlX/CFgpkO1YFLzxDyx/oPi68XfNmY9M5go
	nl5hV3nAaRXCab/pxfG1Yqr+koFEDEgqNztIm/WzAIx84kNFR/1+wTv1YHoh6IkF5pVf5eBRh26
	8SZru/9vRXkBsvP+/ikbekVk8FlrCPvj8E/JAn+nOKXctvpQMYySDZaDYtO2qGuAQggYJUsQU5a
	8oWEa6VJzSN7MCcWT+KMaCtWsIF6RfP3WEDLwqiBRasGCaZTQBn0FDIzB/7UPhD/oe1KO05pHdX
	w==
X-Received: by 2002:a05:6a20:d805:b0:3c3:a1e6:a624 with SMTP id adf61e73a8af0-3c90073ef45mr3157619637.29.1785429021942;
        Thu, 30 Jul 2026 09:30:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdb79a3796sm2433210a12.3.2026.07.30.09.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:30:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Jul 2026 09:30:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: (cros_ec) Avoid threshold temperature
 conversion overflows
Message-ID: <ac9ed0fb-69e5-4d2b-a429-36ca7926618e@roeck-us.net>
References: <20260730-cros_ec-hwmon-overflow-v3-1-c7198ba034ad@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260730-cros_ec-hwmon-overflow-v3-1-c7198ba034ad@weissschuh.net>

On Thu, Jul 30, 2026 at 05:12:26PM +0200, Thomas Weiﬂschuh wrote:
> If the EC returns non-sensical values the temperature conversions might
> overflow on 32-bit systems.
> 
> As these values wouldn't make sense, clamp them to 255 degrees celsius.
> The machine would die before reaching that limit anyways.
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Link: https://lore.kernel.org/lkml/0fbf7f69-bb90-4209-b9d5-258759711496@roeck-us.net/
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter
