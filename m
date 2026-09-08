Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7103D581237
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 16:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883513; cv=none; b=JlD8FXPfvoL7SGVOcmIDQ33HzP6lUN8HjPt3AU5jVR8v4qTgXaqlf+0IZCbIhjHpNkZ4VXSEjs/HX9wTWEosdJ4jMiJ89OQ7xbbTpGnVpqThWaFH5UwmIe4/1EeCDiDtrJDDj32h8CPYYDBXnrL/Cyn0xcOZAZzlnZSSI5wm/Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883513; c=relaxed/simple;
	bh=fSR0OKhaAXzCGXCd+vmXfghPnZaUrM4xUQPA8J2O/tU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lk4HWil5p713CMcEZKdM9xz5FL+6c6qkF/ZcYbTsjW50E2QEkFsC1dXSRgD2GKjGKisoxkSn0JRgJeCgUrvG4HrrmAsTnkzQ8b3QrYvC/ne5t75PDXHywBt+FvIKr5YSwUqEdmsgTgEU5nkkqSMuofFhVcyt0OQkqt2JviIQL+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LwMeheS6; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LwMeheS6"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so3930337a91.2
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2026 09:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883510; x=1789488310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hHrvMGywSx2AdPNWfAoWeJA674yVmyK7qs5cNnAxFf4=;
        b=LwMeheS65Ii/bw9/FGePjWy0hPF1cn2mr3aNuT2JIALFOsgBuOxpIwzHBJE05jQMAZ
         uPbX+JX+xjl7zjxbBN+lWMgq2Ezmk7rPlCR8yjAslXrOVtrGEy/cm2f/bWh88BTACczt
         44SDYKWvOKEorn8g2qZXUeWQgft6583Lyr93QQL0sKxHTMvQeufYTsy25457/MF6z3pB
         PXnxZV+J2jvCwKFd0mDsbpK9qftVQPuDMCR8OWOzKeqM54Pd+C3zZ25pOhVerFLIppT7
         tGuoVLgEiaB5Uh6uSm4SncE+vGqLAIxFns/GPpK5TrdSOPN+Y1YvXL4F4zeStlMaB1Ys
         8yCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883510; x=1789488310;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hHrvMGywSx2AdPNWfAoWeJA674yVmyK7qs5cNnAxFf4=;
        b=Odaz+GLF1j3fBjeAQPY2vA3y/GZrLUb1achC2r2B5NYMdbGO52WtdolSuidhJT3JDf
         ePKj5Gm55/bl0GEzMCSN674tyXyxzb4e839SnpvXLA5ejsAahfhwT4yjGl1v9SeDLJsY
         tnkMNwpb49UTP1GpP5AQ81bsU43/08cxout0p8qReA7y6rOCZD0f4osdLepPTWJvWF4z
         4HMXXkh2OEs9KkmvAidAzEFZB9M3cU5CUZ6zLyH2NOMiepFoAfLN6dhNoJ7/LGuTq5YY
         AZRzw+WAB00nK/EtQ9cPWJXBQDCL559rbyQqrYv6XcYsvrIuMBHiUsL3PSogmmXNfv9X
         AUGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxg8wPUsG4/H58ejuA9Aa8lbvQgV0nkvNV65bq4nYuLdBzLWn5eklIuAHmqOgiLE/9bxJBWuZ3ptlDoeQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nH46JGK0ffm1T99h81Y9+m+XqpJ+PAC+8JmAxdbWeCCjPb8DTB
	PFuXuVSKbe4DYggXttFHaoFLyqzVmcZYfxfjAoakHamsbJL53xBusJR8
X-Gm-Gg: AYBFou34dKy6+HroGPRJQJ6WbrV73/ciDAOQP0w0ueCeaeK6fylOvLHI6NSAUudUkbg
	GUosOAqaY3BtY+XakhHaG4Glvf9PlwRH86dOG6rvAWKumqDKOIGlYa5MNuB817n7Yas6Pw39LCp
	670aV81t0u4JMIr5CtjSZjojLfjBO1c19FhHUVeopeFx1RDBfdBiNM/9yHGA9dQYm2MOac4chri
	fWNeueXzF4sicS9tGFhF+EYx6JgLmK41eLEUHbspcxyW5UqC51zvhp6pFVd2Bj4pvJGjA/ev0+a
	XCdW8VoH04coE6nPVcJnJuwJVMQo0YB3mXjrvm2OPd94+h2KWTZ0nwkG149KbSC7DsrXhsNLbj2
	NeWkcl+HdgAKDxmUsDtjM3j0B9tdAzacg5cL2tmvcZSQu9OxA5A80NL64iC4o0zT/rceWalbXkr
	llsvRBY7UN4gN09ALjfNlWylE7m4Fq0dnI9JwOOeC0VmOLV6al6XRzaLTJ0Wrvod7XjqbU3Xaxw
	g==
X-Received: by 2002:a17:90b:2884:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-39b262ab44emr42903754a91.20.1788883510286;
        Tue, 08 Sep 2026 09:05:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcd243sm34225571a91.5.2026.09.08.09.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:05:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 8 Sep 2026 09:05:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: hwmon: sysfs-interface: Fix bracket
Message-ID: <897ec778-ed51-4698-80e4-25326d7828ad@roeck-us.net>
References: <20260903161204.735276-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903161204.735276-2-manuelebnerli@mailbox.org>

On Thu, Sep 03, 2026 at 06:12:03PM +0200, Manuel Ebner wrote:
> Add missing ')'.
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>

Applied.

Thanks,
Guenter
