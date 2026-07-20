Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A264F42B72A
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 14:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784557978; cv=none; b=J9SzPXKvTvEqMEs37PCGMn3r7Mf8bF+O8lZvDLFm4mwPAKSyPA/Hrsj7dYZhGIFeLlsmbjeqsytp7ayMZf7YN6O8WQCtxxo3cpOfswMlyzah1MuCEL0D3S6r20DUXequil1fwMmCtggbgSCVe22uL75df2mcMBhpqLVlxdtvElo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784557978; c=relaxed/simple;
	bh=w31mzZhaG6xpIihKklYP41U42m/tJd6tJ5IK0JXSLWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ddy2mWkPAhG76u2suoGTlzxV5U/PNIZJZyw+swMX6MPeniU4e2rPtP+oUvTaGKeScoVzqkngAO1aePCjUr5NarEpKiZcD66BF8JJwbRDCzHVJ0xtHG4NbaXIkU6wrlxIoCljgkZzQcAochAlr/M/lwei953AfJN/6CDjvO5TwOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n57kP6i5; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n57kP6i5"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so6001279a12.3
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 07:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784557977; x=1785162777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RYjtczR31kTUuNgNX3k/oakV9UjV64m246GWdWLCZR4=;
        b=n57kP6i5Li8WYVgXgj2rHnNVhrBssT4GctY6Xji1FcDtMwC3Wds/ES1rcVHYYszTwA
         0rKj82E0pY4Xu91HPXNm4zePdRD2Cz0yvhSv2+eOQwodoThtkIybwM7JwM9FzsqwmBpi
         XQDkxH1e/6UtACDa+bpHImSk/e4MJho2TUs83Q88WegWlH264hI8IjmtqHvPSoWB/ZHW
         0afNlniO/N4AI3bjkl/GcAdfVrPNAXBjhPevO3+YD+Z0mWaKafOsEFGe11VmltFSTmhb
         RSSyoGG2tt/IAxc1Nrrox9Z/CpwiAZ7uZoezcZu7/Z8VgcyHnpmLquPMMOXxrmGoDVU8
         jafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784557977; x=1785162777;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RYjtczR31kTUuNgNX3k/oakV9UjV64m246GWdWLCZR4=;
        b=flO3AYI+Al0ZLyMq6kNwcEA8hsZz9KQO93UCFU98gzluMXtfHwaM2a76hthlpYETEL
         v6L8fghpTmCGdreYJ0PB7t/VGudseJZZX9dnWS86Q7/13CQ4xPg2tjb28JC3UUg0Ey9y
         jSXZgUvlrqrHKHMy7Lu562a+d6TFQ3OxwJpT5AJrdKLQmxo6DMqs2H9+lL0hBUWgzUUJ
         tbGKx0v7rQqA62x+yFCaQDo/lCoSvaeVvn0NePT5ChyUUFIy4DEBIk0CyiXK5K5iEwb4
         we70oQjl5zGMvUnud8OoGL3I9KhYfvNZClauRsH1HSIYPfg9LPeAS6JL3BNW5n+H3xxy
         Rwbw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+jZIToFWiVqaufMhqpZw+vPFHG6qtn5kHD98drTpVMpaqpr4I67eDwbHZdbkvorlb1b6LWIOAGg687g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH+Q5RZa318sMTV6dTNcGx8PHpe2m8IlgRtsdAfNp4lUsZ9LSh
	7Sn4887jQisOi3LEFotN9X85lkQto8U/VnHCDB4ujRW3E5CvmjZu9Fcy
X-Gm-Gg: AfdE7clsnPgSu7F7mrQN0HiY/20hk0Y2OkciI73L2kufwcQlOFF6T25DSshSY4Ho0pg
	pKX1WgAHy95bCBzOzVknkfd6uMFpQXvo7PRotDTWSYLVQ8LJHQ6O3qlKW8gzWLxDSf4IMOJUMtz
	jNcyyePOJISoV6rMPM7aVUaLqhdsgGmNa94wlLX6oUdbDR9L/jQOE5+MCibnGeqVB744VJBo4ne
	HG+UeLuI9D19fm9TdwrRFyExjsYlmIgydm/fS+VTMYugEEXa2Hnxz9QECktOBgmfeRzTZGCSUeO
	+mmtm7pJ8BPjwJjgayMrEHPuIDKGqWd+woxaw+319VtvcENkObDUXWY+qvbCgxo5Ezq0CxMO4Kt
	s1yVsm92Rdke83IW3SvfPGHbd/D8pEzi0sn278o3W34HuNuEt8CtW8lvFB3CqgxJDImssc4jxyN
	0GktuAYR/s9X3q/aM=
X-Received: by 2002:a05:6a21:7a96:b0:3b2:8685:1473 with SMTP id adf61e73a8af0-3c3ad5fda1emr14438780637.7.1784557976836;
        Mon, 20 Jul 2026 07:32:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20c158sm40460944eec.29.2026.07.20.07.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:32:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 20 Jul 2026 07:32:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pan Chuang <panchuang@vivo.com>
Cc: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	"open list:AXI-FAN-CONTROL HARDWARE MONITOR DRIVER" <linux-hwmon@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/7] hwmon: (axi-fan-control) Remove redundant
 dev_err_probe()
Message-ID: <f7c31b04-af8c-4835-95d7-f9809077efa6@roeck-us.net>
References: <20260720063745.309331-1-panchuang@vivo.com>
 <20260720063745.309331-2-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720063745.309331-2-panchuang@vivo.com>

On Mon, Jul 20, 2026 at 02:37:35PM +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Applied.

Thanks,
Guenter
