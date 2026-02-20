Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA452F3618
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Feb 2026 20:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771619291; cv=none; b=X1X2qv6/PikeM+z72VEEl6iqq2DRBReCQ3ZSI35yyNL8qIB9Zq6hLflFO8j2+isNbXQfD1XRzjyztfaH7Zwci9rPPHZoTQGumnloSNs7CIaIV9Zp22bBtJ0dP8ze6/tBovaTMcv4d3XJ1kGX+ais97l+9CeDLguE82JbWzY/YGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771619291; c=relaxed/simple;
	bh=453Nn33A6CH7Mz/45At7JAf2+k/ZAtcCyKZ2EEaamaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y60TK+6z1U2Kd6GdF9wh5hidxyQjiS5OKQtLlj5PSrBsPvX4LfhfUYx0lA8NpADhels/VEdprwL3b3H0wfc8llFQ31LT3TujoT16CHi5QgzSQ05UenEFOolOyfxLpUmsPPTY8Ws/cMSZNdnLwQaarJh2ZasK/Qd6npZGwwJbGzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPrSUvWK; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPrSUvWK"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12721cd256bso2847938c88.1
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Feb 2026 12:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771619290; x=1772224090; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NoEzpa83rpLl4Wtm4BAGaxdkwBWEUosdcFCYVTg8N0=;
        b=IPrSUvWKyX5/3eeG6EA8pz4cg/2ohAVCaViII0p1t/Z6B6Apcf9+MyGFnA+teKWhBB
         MeRkFWfbnkRYUQeZdQu0E5UwEgP8VQ4SlztRgZypGD5R7IBeCvcyqCvlcfaZpidNoNFF
         0++V9CZ1rxx80MQsGfXozx28YwRghxrGO/ZSOHDgbukipqvTZzfQrDSgzqXXalU1ObvC
         A3dtAfrditgPi3ut4NI7NOr2G3CzPIU4Db6/dD9R3G51zDu/CQ+bfjaFZXRtCtp5nvoT
         RHxkf6K97j35uZRc/fmsEWMXM6b9RpHHbtIpoAPQQDl42dgz9eeAaYaOrl1QJyamdK+c
         xDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771619290; x=1772224090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2NoEzpa83rpLl4Wtm4BAGaxdkwBWEUosdcFCYVTg8N0=;
        b=ICgw5HoJnDrIMcGJMRcC4QD1dZaexWBFE5FN+faNoVD6dJejG2cwCjm/43ydVoGBcP
         7gq5ovqV/rB3M1+H1igy/cw/Usf9nyr/pWEKZUk6AU3kwB6/V0Ezh3LSsZSwNWEAvZPP
         EBFJmnFaqg/cxSTWEI+TtgHTMJ9jiGhwTopTVXn9PMrRHK6Xw5JGv1v5P/ACsmvYD3qA
         H9GIdF7AykIuLSoO3OyYAUEQbWzc1V/my67tCa2edDYKXi573PhgaWV6W9IjZqwKWnOj
         4G7mK+GB9NK7rzZ45okeDPQzwBLDp9SYqb2ay0hXTClpRJt3o5QD56hVv0YLBRhEf8y7
         9fBA==
X-Forwarded-Encrypted: i=1; AJvYcCW8Rceb8MtUZVtZ4hSXF5zfBXMgWtbZYIu+BR901NChhEyMkf9FyD0u+DJFyaPpehU2s6oZl/cqxV5drQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKkcaYd/5eE4ZzyNsRCjvYCJUHj+S62FSmSdP6cHh1Zy1WOlom
	Z55sFjr1piOLfbXYy2QSJRiYqf9LdtA1xKn3qvCaSR8OBq5LOIi4THAQ
X-Gm-Gg: AZuq6aINeZy+Imhr02nEnFUUKdtwFuV/ar6d8Eol7XxK+qepFX8Hr2DiTKyXH1nsdYP
	ZhxmYnsQWhjHM3T0i5Az+QMpFTjrBXuLqya6VJl/GfSBVRcDwPOBArbkmP20Qi0PpujitZUMbRg
	2JbJ9JfNPn27wNF0HZlRNvb6eUwFLqxDegQy7xhDm6J7FibB8kNOyFW29rX34igch5Hm+2/oA0f
	cMOIkuMiEYLR550qdRnXT8lnaWkk1AXRv412Rn1TUrjh3H7ft5RFjuoaQ0+3HAL0s2EntoDaLHn
	HBWZLxj79Ra2C+dwhliup66i9toCJIqMysXgf5HH2H+3St+8FUSf0ncErPa5GH+dD2QNonLrLfP
	N6vmceqCgk6OGThivLRngOps9yeO5mguxSckmKNLGtSsgv097sGq1CnWVMuDkxMVFPucP7CFO0N
	kBItOYDdMw370o5r6WPsFWQoGcMbVauPUcuJ9W/WgD0u+bM60=
X-Received: by 2002:a05:7022:603:b0:11d:c04a:dc5b with SMTP id a92af1059eb24-1276ad2e360mr394054c88.30.1771619289545;
        Fri, 20 Feb 2026 12:28:09 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af2edd7sm510403c88.8.2026.02.20.12.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 12:28:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 20 Feb 2026 12:28:08 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Varasina Farmadani <sina@sinanonym.my.id>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (asus-ec-sensors) add ROG STRIX X470-F GAMING
Message-ID: <6fe53fd7-fbb6-4b0a-b4e8-3daaef3d9a55@roeck-us.net>
References: <20260215151743.20138-1-eugene.shalygin@gmail.com>
 <20260215151743.20138-4-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215151743.20138-4-eugene.shalygin@gmail.com>

On Sun, Feb 15, 2026 at 04:16:19PM +0100, Eugene Shalygin wrote:
> From: Varasina Farmadani <sina@sinanonym.my.id>
> 
> Add support for ROG STRIX X470-F GAMING
> 
> Signed-off-by: Varasina Farmadani <sina@sinanonym.my.id>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
