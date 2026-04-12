Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1E6265CC2
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Apr 2026 12:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775997463; cv=none; b=Eb7yRTTPC2WTFXPUWlCIVhVQi4UiBJmvvjKCbkLwdrgO4kJoU6qT10jVKZ8m5qy7Bx0nDnoHlwab8UIUIPKrEq3oWvIKrDaTFI0zFZyAb38ZNzcXfelJ5DJrXuhpL/zPEFggIaf/pbSQX1785dGEGL709CHKXyGrAr78thrHC9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775997463; c=relaxed/simple;
	bh=pKLSQS7otot6mEkrdsqOjnChT0O8bqB4O+4Kou8vXjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=san9YrTgq89Mk1MgwwL1iOlwiGXIznNiOX3MAusRCynKBOJ8GMIv+u6AOPJ+00tc+aWYJ6rsdqkaPBBiY+q97uNP28/VuuDK0rT0wZmyq93y8eKWOm1WNcmrFtyjy5lGaKUvnENmQ3Ai4oZTVhbUkCCHNViglQ1fH1SNM/S0bbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcLEraqr; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcLEraqr"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1271195d2a7so3954695c88.0
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Apr 2026 05:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775997461; x=1776602261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+X8jwj4yEWqdcJAZ26TpwPnBf3y1Efyl1rVl83ziB0=;
        b=WcLEraqrEoSi+Hwo6QgCT5vpJO1hJLw0jrZ/AT5MIYi3YHi7mCrc9pQsWuCMC9X+82
         6wc8Q8tikBWCCrMWWCGhqI1pEnXqMlScERsLaNe9ZwJw3+yzG5iZWWGXlLQ+ngfFnJax
         IFm2nXT9WCYyU/zvnWGwpljw7CumNS3Nmq8BdM7UvbuyNWAoUCykvI7OD53zt5oqP/nM
         /ur43POpn+OV1wWgSZYQRLpBJO1sHKWTgsTzmFrmksBqiM+6I5el6KEDc4gei3BJM+GL
         7p5hJfwiSb22fS2UiWqF96kN9Z1moBB4b/rDCuJog48OqK20SkLkZ4RB3tUWvdK10/HL
         kBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775997461; x=1776602261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3+X8jwj4yEWqdcJAZ26TpwPnBf3y1Efyl1rVl83ziB0=;
        b=AH4S3UKdGFpfmGBkU8kexVNl3MVuameOCzVBxkF3/t5s5vlPw52zosFAkXzZwkKBIw
         ogDbzZVim0/u3vNQVB854N4MJG5y7NcBj70jdCim2AJB0pFaMYkt1izGe0AA1LvkXJBZ
         24gAcu+QUM473ojFaoQ00Grx6k+Yj9xhdaWCCX4m1w01D+e6D6juScQ5FBfueao2t+ra
         nM5X8XpgpVbpopGOMeCksZtiZB6svZHJzqg1rn6h7NLzFohEQZVvFwmNRtRg0SpnI5O7
         JJEdXAcLUFYuykG17anfeddsudBhVW1RSupoRwdCEAZSKb+a+so0jJKmgfeHCFx8M1Li
         0EGQ==
X-Gm-Message-State: AOJu0YxeA9opkbKqJ6+23y/BNadmnYbtlSkT5pqhJr1wqc7gj24j1+x5
	J8fFJ2lkvCHkYksqJ0lfqwlRvoUO4/OGmidLHfqMJlCCJpx3xuTX1Eww
X-Gm-Gg: AeBDievZ65eJI7RhquR7v0zpkIKBktpvMBIEJhvzOAR/T7nCGIcqwG2Ma0wV1b3uQBs
	P/It0MqfcNuNwYP63zS8Vu1Dznijv6IQa62gHgUw5t6zq4Ebpy8Z6rIkk47ndH9byL6ENpTebWn
	TxyTs7bgi4QfT5zlhZit38Czmp+m/xMREZYUlhZO8ZZfmMrxLzhXoiX7vcU3OXjenchMnuCOU0J
	yvJb0TJ7XWxfnVZP5U42QLgRns+O547z+P7hFxGH8ZlemadxIhBEnXErfy1euCmDqEi7WubKNwi
	VDqgbz+f19NxGwGvhx4uleDjDn12hPd03KHLOWqaj2WanPPtmmLXuRldbMminKilxxDHE2HU53/
	NWan5YqjTcwXick96hK0F7Dgb5hj07KK7dOq9EqwklQnDBgppnXcyhqvwAJtFmq3XElopJEPrY+
	SxFI6NKFYEG4xgY4hQcSzRIH1y/pz6d6cdUdt1
X-Received: by 2002:a05:7022:6a9:b0:128:cf86:d1cb with SMTP id a92af1059eb24-12c34f16faamr6241562c88.31.1775997461148;
        Sun, 12 Apr 2026 05:37:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c3459faa7sm11919414c88.2.2026.04.12.05.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 05:37:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 12 Apr 2026 05:37:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: pklotz0@protonmail.com
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: (nct6683) Add customer ID for ASRock B650I
 Lightning WiFi
Message-ID: <fef00f73-50de-4c10-8ed2-9f7749b1efb1@roeck-us.net>
References: <20260412000911.9063-2-pklotz0@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412000911.9063-2-pklotz0@protonmail.com>

On Sun, Apr 12, 2026 at 12:17:27AM +0000, pklotz0@protonmail.com wrote:
> From: Petr Klotz <pklotz0@protonmail.com>
> 
> The ASRock B650I Lightning WiFi motherboard uses an NCT6686D chip with a
> customer ID of 0x1633. Without this ID, the nct6683 driver fails to
> recognize the hardware on this board, preventing hardware monitoring
> from working.
> 
> Add NCT6683_CUSTOMER_ID_ASROCK6 (0x1633) to the list of supported customer
> IDs and update the probe function to handle it
> 
> Signed-off-by: Petr Klotz <pklotz0@protonmail.com>

Applied.

Thanks,
Guenter
