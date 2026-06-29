Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3C439A046
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 20:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782765929; cv=none; b=XCQsvXuml1C39dRZ7FIYsCQ9ZT/T2WaaJu5xbcqvmNXNeUFFLTdeM6pkbQkZNmC59QV/7GrTNl1f4DK/PHRaph65/VGPRDOF7tlNWD/14JapaoZxRazKtLiSvqBfxC2jOPX7NViyXxVdJ1BQJT7c6k62R95YqeQKrrBGV+yM3cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782765929; c=relaxed/simple;
	bh=aUo2fs4FT+hE48GV5P+GStTsMbREsfe3Tb3pBmp4FQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHLHHuvDZESVZVxRJiMjK6FGZfFHDc47zbg7p+VSkxbtbOdBONSVSbCKU0PUVRTs4GE4FCMxLyPrs6ZcnXNBirZosaILrqeh+pNpHvi5cs3eRxVPgtgcjpBO25/L/U7IsykBB4aOB5fO/ZSpDR9JFAcOXAZgIjmhoLOoUF94ppw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=noz3EiNW; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="noz3EiNW"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30edbb0dc5fso788472eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 13:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782765925; x=1783370725; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUhtUwuKqgT7pYEC6i5bQMYErh/JXD0EygWPd2bnAfo=;
        b=noz3EiNW2GS6wNTX3Get0RCJzdxjbkfVt4AGO3Shrtzd2tDLpYZ3Zr9V7L64TkgDwS
         uVY41+sTh4m1FYEjkUHaAG2ONknpQ/dgH7F3HtczHTKXm1dL9Sk0FdB/1d4+q0p4SNPS
         iJ+4v2qA/4ZvTlxhV1k2VQhA6D5MjI5l3iIIZU4wvxGhm+B3yZu3cuK5bPdR9HNpBVKM
         YXP5K4bHxuTEEFgHIMA/U49I9WXZlaOCK191XQlhfPifDshHlXVsbLvIexkRqquenjiF
         qxcgRo8Y2jJcrNJGTQ6TCa6FBfUew1PWOhqV01Yqj24Qk1hlikH1axxN7irgS/GXVagC
         jjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782765925; x=1783370725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZUhtUwuKqgT7pYEC6i5bQMYErh/JXD0EygWPd2bnAfo=;
        b=NXvgHmLTqe+ojCD/R4YnaDH1sJ0eVQxCzHE9gUgcjzUpOPFqBY+2juCGsYTX7HClbw
         Zu82yr8FWXsFfEbHMWNi6aX/MxHZ0fmkb4QJmiMYlfleh2FdSgi0bcpF1Ro7MiaIXZtV
         +M7RTvN8j8N611jbuqv2/V9OHU4u8gbkb9B3hJuAb12kfGBQr09YZe0HpqbuIyksSxua
         KLoTV3icGAd4dLJe991GIjkEVgSIMLMKEj0h09QOqF2jOYTtHDQf7G4OfvNjw9Z69MjC
         i0dz1dzGOS+kBHk6tc8wMWlSUKBjAtfKGQAgLwqpdkctgHnnIqgvOkiWGTZwawUPsgKj
         A4UQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZtvZm8SFkYbxRRDaY+WCC46DutcyEVTw9PTs3RvwrxSF9J/orD/2oNBYndjuJfnzgWQCeigC+MErwGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3UnJGHXds5g9turphB8LLjECO42Y3hACPxIIFP6tyxnzCvx0G
	+JV67KgXoJjoREgVJ6v7QXsBONPBVPaz1zeYuffM6R+1LBsAtBHofdqd
X-Gm-Gg: AfdE7cmUjC9EN94tS9h6EFQ1kR7GVky253oO0RWpEVdCfDN9YNebRnUSJa0lTNThomW
	THJ2NbnZyU1HGzZ43f35lwrj98nl8c2ZWyTQ750iYNPU5xfAwF87ztkWnk7rlprNGw5l4dqPygQ
	CDHVvv+dsqlMOUetQqg0wuOGqWYuIbr8cqp2wcRZy4r2WOfirsU4XFUg/ZwdkEW7PE5viyKFKhK
	vfWK72Lh4HPKECVcRFMFzOSy3XVIWPaXh5vO/ZQhFsnsLR+AtrKf73DhEJoj8+mFwAWEUv6Cnbx
	qMzIE7wVmXzmsv81hidq5+sVvPcXWd/JeCu/EC5jwC2bdSLEdH1TXK9n0kyhaSSTGE4a+ovlAo9
	l+w53K0cp71HWyZbM52VZWrhXR4V9xsgMv31RJZjXmbPr1S9cyFX++gQ6tL6MloEd4j21uHRzTQ
	1EJfyBnH4IiGE11ku/tWZjhR4tuA==
X-Received: by 2002:a05:7300:8187:b0:304:d14b:b706 with SMTP id 5a478bee46e88-30ee144dff7mr588108eec.27.1782765925449;
        Mon, 29 Jun 2026 13:45:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee3168af7sm1150173eec.19.2026.06.29.13.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:45:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 13:45:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wensheng Wang <wenswang@yeah.net>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Robert Coulson <robert.coulson@ericsson.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/9] hwmon: adm1275: Prevent reading uninitialized
 stack
Message-ID: <d4e79a19-a207-448f-b854-ead8cce8b6f0@roeck-us.net>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <c8ad38e0cdb347261c6245de2b7965e747f28d22.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8ad38e0cdb347261c6245de2b7965e747f28d22.1782458224.git.mazziesaccount@gmail.com>

On Fri, Jun 26, 2026 at 10:22:04AM +0300, Matti Vaittinen wrote:
> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> While adding support for the ROHM BD127X0 hot-swap controllers, sashiko
> reported an error in device-name comparison, which can lead to reading
> uninitialized stack memory.
> 
> Quoting Sashiko:
> 
> This is a pre-existing issue, but I noticed that just before this block in
> adm1275_probe(), there might be an out-of-bounds stack read:
> 
>     ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, block_buffer);
>     if (ret < 0) { ... }
>     for (mid = adm1275_id; mid->name[0]; mid++) {
>             if (!strncasecmp(mid->name, block_buffer, strlen(mid->name)))
>                     break;
>     }
> 
> Since i2c_smbus_read_block_data() reads up to 32 bytes into the
> uninitialized stack array block_buffer without appending a null
> terminator, strncasecmp() could read past the valid bytes returned in ret.
> 
> For example, if the device returns a shorter string like "adm12", checking
> it against "adm1275" up to the length of "adm1275" will continue reading
> into uninitialized stack bounds.
> 
> Prevent reading uninitialized memory by zeroing the stack array.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Fixes: 87102808d039 ("hwmon: (pmbus/adm1275) Validate device ID")

Applied.

Thanks,
Guenter
