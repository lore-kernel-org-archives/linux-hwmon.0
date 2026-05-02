Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147E12D0C72
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 18:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777745784; cv=none; b=F9E+cOAIm416WH8T1/dxEIUhICFnHZ9tapbS/k5ltWVjENiJXaEo5dMb/E7g/S1w3J+443KIPmBMFUXo+UWl5APKMjFZefNZVLgxpaREfLdQHTyspjc0cyajUBwuPpUlcEj1svzFXw291ZL4YToaUy+bkGWPyOBim7EaHPE9D/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777745784; c=relaxed/simple;
	bh=lgEh2y3aAPjE3lHpoVc2MSJ/tNTzJzOWT0DCBtEdpMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVA9re7R+k7lw9euyNr7+0e62/xLVlTqFpFGbx09HoUmzGykc8CZJuc4VfKngHhcaZqL+DzM9yAPmroyZ/DJtBRAD+i/0dsmfbYIe2HDhEMIFzXtt0rNDBmBluiLBOY3u3TP5kl7EuieO0m1eVwNVXedOq0Ormye86nmZ5jhKdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0LlWTQh; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0LlWTQh"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ba895adfeaso3192420eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 02 May 2026 11:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777745782; x=1778350582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ngHbWA/pfNaN0/2JKxvaCG6WBU4bkHR3Hu8CaTqeYmI=;
        b=K0LlWTQhI8+/tgRNmXvqBhzmF4hlwgXSUiy941lX1/0370a1bQzqAxAwtLRIaI2qGi
         ErEC4NYjKHZPcR0+rDTzBnT4gE6ksutj1LpErheN1pNoRT0F6cScB43SxpzopiNTov3z
         uVEoOyhCG7uMvx3u4VsfT/HFq6Pr/4q6wQgWMXEqcGjuLxU8iCw9dCKXYyEPTGIdqUHe
         lwZW+8CUlwJaMANxw9yQbnYzAIWr0kqwLJ7XFKvAZuc51wEs0c7rdxl6itrYijtfz9gA
         TFAi0k76hHHNn/cM1BcFbGDmyNJrv1d8ZpjXe+ER/X/y/mzxCiHg9nJ+T/h84Rli4XTq
         0ekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777745782; x=1778350582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ngHbWA/pfNaN0/2JKxvaCG6WBU4bkHR3Hu8CaTqeYmI=;
        b=kdW6LYfJFppG2NIzAikJo4o6SIbS+WYhzVCKdpi8I5b0cXG2lkwlTAmdvQi34AWg2s
         rFMq0nYOhbw281sPRUyzW9C0kkKYAg7RqnS4LzvFypPRH2oVnFSSnuXn9CCEUWBxew1u
         LSKuBUyUGeOGyW2LtzUF5UVXuvAP/A0YEBO2m9o1o9H/M9h80AErSDBhT1XKVGRyOw04
         wzmpwzYjUO+2cTxLzXBkwZIXVLQFXrx2+l21AFXyfZQH7a96KKVq8Ry2RFasvxbWd+h8
         ahf3QAYbM/TDDC099OPJ1xjNdbst1z7eWC4YDuGvEijgP9sBWIOpsAy0u+RMyvZScN7P
         TqFA==
X-Gm-Message-State: AOJu0YxAeJ6/B8RHZrjtklvK1psOX+UvmFIg801MGcPpw5mBRBK7qLMF
	ntJLSwoNskY/7mMuX80RJC+Kf3OlVpuwieS/mvERGg7Fsb8SPAgodSm3geJFeQ==
X-Gm-Gg: AeBDievp4sjM1CGFhikNqCryV/8621SsEUYXf0MHxb/RixYfwgQO6i0TH3gSxqw+E/C
	cbSO71uR0382c72W0xfeZGHcbHsKeZg67M8GdU/FkOEOGiBLnKBUvbHMzGSR8Bl/qiS33G9snLk
	z4rmlxngTPkPgHSZI9tTst1BCcO08zQwcYiFAPZpWMh9j+K3eoGJa7uWFSMxpJkHPsLWHTXHicA
	v7nHBEAubv1rMHu+RP8MdF75WgggOqQ8thaLJROJNkwAHMX5z9D+gEeJqVucx+32Vbgjkux+szX
	4TDto0g4muwo/GhIscrCH9OrjwSWfF4pQnTcHA10xw+tuQgwRG95UBPHHaxBzZxbwqcJLye/KA0
	p+XmURVQPoejoP+Z3jV9a5jURAiBKStJjd0i4Q+5i9khJeZVRqMfaiMHTpHQbm7E2+MumhrmGEF
	/ZP8UzjsP1fou13BLfQpQNknWbzvU3b2uTPYhHklDXQgBJe10=
X-Received: by 2002:a05:7300:cd8e:b0:2ca:7eb4:3e0f with SMTP id 5a478bee46e88-2efb7bdc8c2mr1633753eec.5.1777745782231;
        Sat, 02 May 2026 11:16:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3c24e738sm8963419eec.31.2026.05.02.11.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 11:16:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 2 May 2026 11:16:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tabrez Ahmed <tabreztalks@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	shuah@kernel.org, me@brighamcampbell.com,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v5 1/3] hwmon: (ads7871) Fix endianness bug in 16-bit
 register reads
Message-ID: <d1d0adfe-0acf-40ef-8b0f-cc05c48dea57@roeck-us.net>
References: <20260501023530.31160-1-tabreztalks@gmail.com>
 <20260501023530.31160-2-tabreztalks@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501023530.31160-2-tabreztalks@gmail.com>

On Fri, May 01, 2026 at 08:05:28AM +0530, Tabrez Ahmed wrote:
> The ads7871_read_reg16() function relies on spi_w8r16() to read the
> 16-bit sensor output. The ADS7871 device transmits the Least Significant
> Byte (LSB) first.
> 
> On Little-Endian architectures, spi_w8r16() correctly reconstructs the
> 16-bit value. However, on Big-Endian architectures, the byte swapping
> causes the first received byte (LSB) to be placed in the most significant
> byte of the u16, resulting in corrupted voltage readings.
> 
> Replace spi_w8r16() with a manual spi_write_then_read() into a byte array,
> and safely reconstruct the integer using get_unaligned_le16() to ensure
> correct behavior across all architectures. Additionally, use a u8
> variable for the command byte to ensure the correct instruction is
> transmitted on Big-Endian systems.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260418034601.90226-1-tabreztalks@gmail.com
> Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>

Applied.

Thanks,
Guenter
