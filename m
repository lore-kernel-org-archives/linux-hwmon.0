Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82A235A397
	for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 17:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269270; cv=none; b=VbntzZ0PIQbj/jpWd2cwrlt0CYMrElvKP0muMZgMpQLQkMzo8DPjjvCwtHhEuvigx13EuTLagDMcuZckL2FlY7jlkPtdYO/fo+FV2RfaA6tcUlfQPNpNAu4O4o+uwL3lTZyFBVc9GKcNSh+hvgSdAsO1905DIk8QcIn9/4mBZ7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269270; c=relaxed/simple;
	bh=U8S3zEXgb8/EzEJgSl29uOk/PjIJsBgsg6IfhZVzWcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=adZP3DCDJwUjSNqOVIo7mNG58iuHBS5CtszGQJdNEPd80NDjB3yzS9YC0m4VmARKHEA8RRmiFfQJqz72syJvJt4DB01YdfKMxR3QQaqcZAaFNNs8tNwFTIuwtkm0azkgUiQed8KYdN1RM+oQpQkWUvZ4maYtBJVU+53gvxkLcPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGQB6/qx; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGQB6/qx"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d91c22d27dso9296835ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 10:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790269268; x=1790874068; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rigcNwes1J9QWwIScPgAbif0PmLq7wO30EVNxOIBrHs=;
        b=RGQB6/qxAWEJqV/6C/ukrgmAVEs9SfqoYFSfStcJeK4QAkppndGqreWk77NvhTQcEr
         Vd3PEtteMALCoPYCnYzMPDeCT4v61/ZEYaGTZeEnermFVAGqqHx8+kjyYbbUgFhd3MGL
         eXBnYkYk0vstuLa7mr745a92aEsVNzTJUSLomue52tGq/mpvP4DwedxqNxgej+arrJLs
         6EsaniikSToyx4H4EyjZiurrZFEXDm+yqm3c2uPozhXJPOX6gEWJc9QQquOORw0qCPJd
         uVXEGpt/St/D8WMKybLs9LMF9MBYubdJBto9hyCOi7SrUB0MZ5ZgTFjgNvt6IE6O6mSC
         CzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790269268; x=1790874068;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rigcNwes1J9QWwIScPgAbif0PmLq7wO30EVNxOIBrHs=;
        b=sDazyMLVDNuaPw2AunoFv1oXL1RGDXvds5L5DLwi4QxpqlqZSiT0gwkpuEeMKpO0ld
         Ni+Mm9xqEMx11T7fj8kBm+I8yANvSUHt0I3y1DV6UxzuTknuEExVOy1XHFQtvG4pfaOs
         onjOu6k4fBAtO8jIz/Ne+4gLzUTEpsdtH/mMK2OnVAWxH2yb8KKNb4mKB4vxHrK77XHJ
         YOf87NN5GTyLcOjkPt8Bfca3zdV6IFA9QDtglfWxePUo3uveB8UlaYC9J/cApXOEjdpb
         qy8gm5C+Q1TfG2Y3ihbMkZnSWlwhCNlQOcBq8Va+XazCAc+0k7SVsUW52OqeMDOnysBP
         LJjQ==
X-Gm-Message-State: AFuF++mFrMtNr/4DHgsUzN1Sskcz5R6MR4XdNXPUA6ega3iHyLNQNG75
	Te8ArM6meK2RJFosNYHR8TSW6gBNuZo7ZotnBk3YTiOJXDxZF/BEtMb3BBs1kgoN
X-Gm-Gg: AYBFou2yUzz2ezTOZ/QtTgtaRWEFeuNgwMXQg91AmyT/UOg+Pf+bqE47SORmiRLrmpb
	ou0seLpCMM+OXlzw8/MAWJvPzBjZ91c6oZ4AjcyOskvYZRx1uRlkbmp9lTaR6FIlUwyw+3Im+Jd
	aXE64UUzhPCEfC4VL8m6aRc5y31y2d/dDi+plZu+Z4XHIkVG2qt0f6Yb+PtpF+9aG4Bqp2P/zeD
	ocboE3gvXAOqD9GyvQX1uUZafxQUKdcwbpIkgb2RPuI2WRcORmld0Of2nHkjFsWOy8kKn/wSMIm
	zYgWmI0WpLz4deMixRqLZBAtuOLT1Yda2uawqcxsK2ylefSpzwhJH+9l1PkXgN8Bl4R8hJgeh49
	zm813ZH+FfX6QZ9tYGDJRn/U91O7PjtXrD7bmFSwLmiwMAOpyN7SBsv31INDzmmLXXOSmCCTYuA
	53PWfv1ESFAPYd/su4IrlLUffJ4ZxLQsLuyWbdwcVf7yOi616jMMVCguqB2Aia4UWNkKiznhqOY
	wTha09h9aC1
X-Received: by 2002:a17:903:19ef:b0:2dd:c053:d73d with SMTP id d9443c01a7336-2df7dc38800mr26997485ad.36.1790269267985;
        Thu, 24 Sep 2026 10:01:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a60c4a8sm30701835ad.79.2026.09.24.10.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:01:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 24 Sep 2026 10:01:06 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eduard Zateev <hackerowskiy@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: pmbus: ibm-cffps: avoid format truncation warnings
Message-ID: <cae03929-ac61-41c0-99a2-928ef57a1223@roeck-us.net>
References: <20260923024827.56445-1-hackerowskiy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923024827.56445-1-hackerowskiy@gmail.com>

On Wed, Sep 23, 2026 at 04:48:27AM +0200, Eduard Zateev wrote:
> Building with W=1 reports format truncation warnings when formatting
> the firmware version values for debugfs.
> 
> The SMBus helpers return the byte and word values as int, so the
> compiler cannot infer that the formatted values fit into the small
> temporary buffers. Cast the values to u8 and u16 before formatting
> them.
> 
> This avoids the -Wformat-truncation warnings while keeping the existing
> output format unchanged.
> 
> Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>

Applied.

Thanks,
Guenter
