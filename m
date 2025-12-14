Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8F3296BBF
	for <linux-hwmon@vger.kernel.org>; Sun, 14 Dec 2025 17:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765734874; cv=none; b=T0vTfheR17a4v4ysDc/W6jhiZ3wS7DPEZdwTG6/XvtIIz3YWbCgNyPcuX18I4t9KJpcOpnzezX6+12i3JYjqf0BflUTU3+Gwsbtt0THIx9mUw3iCN24RzQ+9u5nku7uxDpZFWBybfWeWHqtbEJTHjUoKDjkOiJVwMCuv1gHLw5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765734874; c=relaxed/simple;
	bh=q90fwVCsStew8YW3IF36ZU9dwxYnZ0k76Rea/XbpPaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwLm3gD2qrBG24drE/A+r6l9fSa+dH67q/ieJDor5qUubbc7NyBmtBX0DwHvXbsLzOrwKEe4kGeFsBYyjeiy+X0lI1CUrM3t7f+NCzdhtDtbI03CNHkGnGz2sWvTOOPLb27rqt9x7DuVBvHQEiAgak97DsulD3q4Hi4A+ttdjfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5YDoVKh; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5YDoVKh"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-bd1b0e2c1eeso2075920a12.0
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Dec 2025 09:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765734873; x=1766339673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lHNl7WC4mCyjKwfsvpO/12hRC13Bl9TwcCjR4KxaRxQ=;
        b=g5YDoVKhelGPwRaldMvD/+yd9KgVKH9TQgHJ4pP+PhqjEDB4vEtbAIwIQD10XhU2JR
         iQHmlADLHX/0G+1zhCOUqpdMG5dgssUQqfTkdzvwYVQ73kImZlvWPfbUQs1LbpqvOqnw
         t7RLoiXzkWpY1M0/uqUiFpY5QqhKWXJgu6PxOkMKuWXU/7+N+AbdsqhTxkq68KdqGkjz
         OEsTCe0gl/7Egfdtkn9VL2ucqnUXeOM7Z2qKkopuXF/r0l1YfxNxzly0X+vcuI2+XWiw
         jgGTDSluWclqLia2s1OmCNWk/Dcyq5sL0JoRPAMfusWozjKtBN5rovsjUlI74knZvvfH
         iqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765734873; x=1766339673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lHNl7WC4mCyjKwfsvpO/12hRC13Bl9TwcCjR4KxaRxQ=;
        b=t3E9Ijl7MPvR6XYpI3fC2T7pmDi18uOl60mmKw18BwDkeh+9QVRWN9fWl253GCr4G6
         Bb/M5pQ3/RfDDc/wcpO+v7NmsCg2SDNE7u10SSohetVSWhS3ErayY264Hy16aS3ZCc0O
         o1myPWbKqXGatNfn5EUeKR6Z8fJWXmQQfI1eBO+97uJBmrcLZwpJ9Hfr9CmXKN+zArkg
         VZWcvamibXQX71njEfXAU7lZhp1M0VpcyoSvdRVblhY9KXy75AfYOkBUReUllD8zl9C9
         kH7SGOMJT6R2l/UuejFAVoNCUfTeAB5oTw4VukcgRNU4fl+cVhBm4vDRl5flIC03o5n/
         3zpg==
X-Forwarded-Encrypted: i=1; AJvYcCVvA5mgZH7VjjfRrzXSaTqT49C2gtfeMtf2og3DJOiwwJ6luV5gWbpqzzsrHP2HAxarsF3f0VwWH3XJAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7SSa3SiYt0QCRCP6DJL+l05zs6MIbeRp8U3un+DZo4wrUuRjB
	IzBl5wTb8wTrDB0ll6b8YL38usij86JCMJ7lYs9HJ3L69Tg34d0p8thA
X-Gm-Gg: AY/fxX7MXUC8i8PbX1w9huvyS6rcQT+xQjNRIGnjLOyt0ug2zkNMs3ANif+hBPjV0Wz
	Jd/npfBZB/HUji21jy+hwMU2yhzvTd1ZWy3dWyevCn9kNsy8ZtjCLCAd3OtsLlhKYuC7rzEdICw
	+bRVFuJExAtnHHdI2VKmYiWEkuIMIkRgMH2WXyW9K8oLZ7wCF5oPS2yi5azAbYCXH7b9cOCcwSR
	FXQik/f5lEJaAsR7+yUVSzsBX5wkDVralah+z7yz1nStJYL9fP6BVsZVy9xAzibJ3uis+2l/TMx
	oYwXTz9wNOeBVw+pSJLbd/qIQdwROaZrLptWd/mi/+zDsNWtIj5bd72iSTo976HgwUX6L9cK7g7
	p19eBxNh7/EI2/iM8hCVLVjYj75JYNvzSdhE4lYT0BGTt+2mCDfEozET7W0i6xqhIdxJHRfpv9A
	l+RdGwWHfcmW16xrg5oyjQuxc=
X-Google-Smtp-Source: AGHT+IEgY3xOmtDCZr4aNfmu52fKGCF97qf+0IdsWoAYaGwxw0Fmw2tARBFEIekN+sLdpxcVlVd2OA==
X-Received: by 2002:a05:701a:ca8e:b0:119:e569:f60b with SMTP id a92af1059eb24-11f349a1a50mr5431084c88.4.1765734872675;
        Sun, 14 Dec 2025 09:54:32 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb45csm38312053c88.1.2025.12.14.09.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 09:54:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 14 Dec 2025 09:54:31 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Robert McIntyre <rjmcinty@hotmail.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (asus-ec-sensors) add Pro WS TRX50-SAGE WIFI A
Message-ID: <78417183-c423-44c9-93ae-4d90e4cab0d9@roeck-us.net>
References: <20251213200531.259435-1-eugene.shalygin@gmail.com>
 <20251213200531.259435-4-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213200531.259435-4-eugene.shalygin@gmail.com>

On Sat, Dec 13, 2025 at 09:03:43PM +0100, Eugene Shalygin wrote:
> From: Robert McIntyre <rjmcinty@hotmail.com>
> 
> Adding support for Pro WS TRX50-SAGE WIFI A, which is identical
> sensors-wise to Pro WS TRX50-SAGE WIFI
> 
> Signed-off-by: Robert McIntyre <rjmcinty@hotmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
