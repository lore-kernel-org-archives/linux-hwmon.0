Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BE53C3C05
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Mar 2026 17:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772557396; cv=none; b=nqyLD7ogXKU2vfJqOzof9jFMpw9JGXNElYOaOpW5AfJEdGJwfCvd+yAEGuIEknDf+zdT7ELGf/i1eNNj46dDQJ1X32QccRO8Q21BYJ34TO6iUfzkUOugIcTuG+QkVrjJcD4BIwo0lH/qvTWScnhzJ8ZLPes1z9B4Rz7Wzy+s4BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772557396; c=relaxed/simple;
	bh=c7aLvDSU+raKnP5v/QpAuebhnXlsccPbqB8amLtAhOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9fI/MbNJsm0eeFni2WUcduGlv/kDoIsdUcSyDWr5qQMdiKqnXcLiY2jJ0uhH7x87dhMWLRytHXncGUt05knTg438nNvT4Dz0F4lEUBawLOzV0kJSLCRLOxmEUuetUOC7tTOFSg1vmwLhnI5OPizezAgq8pzCYQ0nrUGO1ZQRTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7qy6f71; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7qy6f71"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2adbfab4501so26796935ad.2
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Mar 2026 09:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772557395; x=1773162195; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eh5hnbYyCw4n6Sax5xc1Wesgy7fTwBbegBAK9uTylYc=;
        b=A7qy6f71uqUEu4mxOGFo8/AofHQDNnWAdiXwlhpy9otpF/FyhZTMPViattehCYUl3Q
         5C19iRCD5fHk6PUrEZDFF6lZw63g8bY/F2UzNiQ0d1b3+8lmsBBBUHKTVrPgdJnaBIDg
         FV3DRDW860NlE0gLk8iCVOTZ0DgJrBp4zhLsnhdlV8BGCLyb8vppDSpbGjhhR9Ei+LsE
         Ad/HvsrdK6R6LztR85GGzmqsE2X7ScFaVvB5FfeOKzglbMt08ntA7CCub04I89H7W77C
         8cf7O5I+SvprEb2u+fvYX0Cy48kIBWilwQP4xZIgqyZ7YinlTBpyDw3bzdQ2+2otdDah
         KNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772557395; x=1773162195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Eh5hnbYyCw4n6Sax5xc1Wesgy7fTwBbegBAK9uTylYc=;
        b=HuuvUmqKU+3/HuBiiP9DojhxaZBfHKI33tOpHfJiyWi+KO+rw69W+AM5ab5Ptn6byA
         8GbgUxDUjiKTRQ5MVnrLKqynxfAdKq7hcRNoLBlwO7u47YYj7nZiIB7TVjHUQXJDWDXS
         /eGIZ1q06TvDnxRYKftBYQ0B2U5vuLjMt52VTKYebTdpjF7TtIH3pwsQGRDQa4d4dbQw
         6IOwhYPyD0sF4ps+2TbbFEwOGH9n7k0jXAclPKcLm2JbOpu/2AdJ5PWpveN+VzXCHfe4
         SAyHlei9+q8GXFk4/fR4o8pSursofMocAq2C0+HBSyPyuisr6jcKlso51Sb+3RnASFyk
         IaJA==
X-Gm-Message-State: AOJu0YzQ5OCyJK8C6qnhxznwhEHl+w8sl0Bc0P9LGy0bbB/FiFlyfkBO
	1fNFBS6VUNtpXzfhFb9buhsOBnZ1X0gcYF087fUixjzDagmU+afRjLl2
X-Gm-Gg: ATEYQzzNccjJoq04JzH5LtL0vPqg3FeXmp3Z3ZW2FvtlP2y3ClXa0ZUyCum427ZR+sp
	/soQCGbpqz13pkn3TKVz3cM01WsMjUfo/7+WRH7RMfla43vfxHDuN4+6jxdRXDHUSISEBopSWjk
	OwP2eJznNeQam6GmyUI+gNyQQNCBlBu/hK8KUkaUQh2XeEC/fw4tdjE7tD+vVy6Fo71hazZS4Gb
	0ayOJ1QtBnUHeUUdydiQY5sWQSLCjE5OiKHPkQo43zGrnqjTh4mZPDmOrwIYr5KFsIdNfLOfUJZ
	ING3bbp7+SAUEilI18r0QtWprHIwK9kS9WI3D4/I9u1YPaDlWjqeMVjfHB+k6Mg0RZJD2Qd/yRY
	SoWiT1VqxHIQa1a7djrgbXB8ee7GrgKhJfuJWraSN05Ac7BAAQRkAnpcpB6iGU+DXDdxw8ocUf/
	pu/JoV1WTU+wpbiC80FdKQd1Lthr5jCRfDUKr7
X-Received: by 2002:a17:902:d54f:b0:2ae:5d94:28e8 with SMTP id d9443c01a7336-2ae5d9471d6mr41577495ad.56.1772557394122;
        Tue, 03 Mar 2026 09:03:14 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4b9ac021sm74436055ad.86.2026.03.03.09.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 09:03:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 3 Mar 2026 09:03:12 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Amay Agarwal <tt@turingtested.xyz>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] hwmon: (tc74) Replace sprintf() with sysfs_emit()
Message-ID: <181ed7bd-b4cb-4daf-abcc-fb37a8466507@roeck-us.net>
References: <20260303152456.35763-1-tt@turingtested.xyz>
 <20260303152456.35763-2-tt@turingtested.xyz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303152456.35763-2-tt@turingtested.xyz>

On Tue, Mar 03, 2026 at 08:54:52PM +0530, Amay Agarwal wrote:
> Replace sprintf() with sysfs_emit() when writing to sysfs buffers.
> 
> sysfs_emit() performs proper bounds checking and is the preferred helper
> for sysfs output.
> 
> No functional change intended
> 
> Signed-off-by: Amay Agarwal <tt@turingtested.xyz>

Applied.

Thanks,
Guenter
