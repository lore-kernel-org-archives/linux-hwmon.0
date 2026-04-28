Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD3533E36A
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Apr 2026 17:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777396425; cv=none; b=a+UwFFhtVPAVd4PZpW9xlz23GUUEC3Eq+39gKNDSYY2VaRBRzhMnqMH/A1uuVxTJIJrwuGj4AXq6nZZMEOzJpNitPi4DYS9Uvpz4et3cZTopvIN/4zX5y8sPlrPq+lIn5bX/CaeI2Ol8pKVx3/n6gysHRh+a4E8Bh7lJThOl0so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777396425; c=relaxed/simple;
	bh=zNwt4MuWjFHi2nWiChHMSukn7s4+6k7LIxTrHSdJM0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SeljTvuW4cTKD8QB0T0qQdCTfjSFSxImdtYIWJxQ8zfhcqvOSVWIVvAGYaU1dPYLAbY6hbW/psluJ9iKcHrBYgZWlprmuAbpLLbQjyP5AutbdgfyUm/pYGcqPg1V1X1Xq8mu+Kzkhj4KveCAZxQKhFcECM2W0IUnscMmdH0eYEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDt43/Zx; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDt43/Zx"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12dcdcd54adso1679053c88.1
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Apr 2026 10:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777396423; x=1778001223; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m7kYEmzFH2q6R/2YwOkSe7g67dqcrJT0bRYNvxoCekk=;
        b=QDt43/ZxUAqu/y9hK/pLoUIBmncVLO1csJJwXqSGodZFq2sFJzE2Hv0eksvX/MGgp/
         0vgNJjXiJXQ88GBvk3GgPUbFFXs5soUN5b3t7wwPHa40FY6M3QoitjmmL9ZpsX1XxDxK
         M6hypYRrxf8Zu3r0u1IEjXJ67F0m8dOYTzvTARAMO3A7/Grtg9IyWBszjbiEUduO3Jdk
         dtFpUNvVyd1zRaoqYVA5mM+uxk1SJr/qlla7BbzkPdFoINRDy29n8YhDbl43yTOjeH+m
         t7oTIxOFwxTNpcHftcESRJJ8A4P+sZA/0vYPx3XoRKwQzhj2AbjOULmj1j93YAMm5L2k
         7/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777396423; x=1778001223;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m7kYEmzFH2q6R/2YwOkSe7g67dqcrJT0bRYNvxoCekk=;
        b=QLjLj57ClRVD21NKqdt+awrhZZhjjVbRcbpU2CGwpxcqJkdomUvPmEAApGG7jrNofw
         1wszdEUOrEyv1JpcguxeR39MfkBEX0GSyF9e9zfHkrh7fFPa5HZlxCLggKWfN+9Vycup
         xR0+cHPj45F57ne0iNqZFb7CfZWjTZ3osGJMlafytjtbGYOW52X8TpEA2uA/Xmu3kdzv
         I47395yU7OPqwG8t5VOHPT/Sd07kfFXAOCakgU35+rw5wNX+LnYJH/4KBrjmgB8AWgVq
         1wzPRSEwymoc6ZXOI/6D37BCfvH4mHGjc5aEYwlciGe8fO+A3Evc9N2UvqKWN9M8Wem4
         0qGA==
X-Forwarded-Encrypted: i=1; AFNElJ8qSVhgU48nIGR1G9u/fIdMc/bcv0B2U7XghULi30hwdcCDCm8IzSxUzPzdkzv1Inq1hXGH2gktV+Huew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOut4tVT3zJk78AyN2SByEidnc2jaYVlVdR3AtUQKwJF3oLa8X
	/YQzKLovcF/sVAVlgYXba2m/VKeXX0tK6aRqbW2aC1jpTAvB8ROTiNEA
X-Gm-Gg: AeBDiev9kXxKYgkdWjz7n6qv0FrRgLX+f6N8JI8pCzOQARGCTR8BUcHOshq5otginGU
	9FcK9fW6o+7QMH10OAXBVhgMq6yyKPBO4mygHeLtpKK2uwmSvXc97o3txxh+uL9q/dEUDy7S2t3
	kPgGisZNoYa3UXtJ4KFTRyKZ5Ah8wYQURbZw7XZohZRHCkpTezLjxPo3Maqrz1c9Evj7KjhhPfQ
	+K/gczCawII3S5WkftqoYVoIjurF7FAbxUGPfpG162ZXda2fYdWtZkMnpRSgYUkOtcsDfyp0k2R
	DOIVuQD5VI8oQ8xSdw8NP4FpYaC2zIm3CkYdTc5PSSIQcbADt2ixF+mQgQ0DBtMyePkQey4Duhr
	7lPxQZjffE7JPjX1Wg7fzZvAhOrVfnUQ/biCw0QEPAU3c3Kxtp2Ut60HPsWN1lZyPgJqJYJ88sq
	G7vehUtPD//H1p4vzqypeEJEFNe1NSDzXtcGDYXVsK7E6Rfzk=
X-Received: by 2002:a05:7022:628e:b0:12d:b6cb:bdc9 with SMTP id a92af1059eb24-12ddd94d41dmr1845430c88.9.1777396422802;
        Tue, 28 Apr 2026 10:13:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd9b1bfcsm2417790c88.12.2026.04.28.10.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 10:13:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 28 Apr 2026 10:13:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Sergio Melas <sergiomelas@gmail.com>, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Armin Wolf <W_Armin@gmx.de>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>
Subject: Re: [PATCH v2 1/2] hwmon: (yogafan) Use u32 types and improve RLLag
 filter
Message-ID: <445bfb9b-bd80-41d2-9355-e2754dc1d6d8@roeck-us.net>
References: <20260417142455.18806-1-sergiomelas@gmail.com>
 <120f01a2-c77f-8be6-68a9-3abc574c0c95@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <120f01a2-c77f-8be6-68a9-3abc574c0c95@linux.intel.com>

On Tue, Apr 28, 2026 at 01:44:33PM +0300, Ilpo Järvinen wrote:
> On Fri, 17 Apr 2026, Sergio Melas wrote:
> 
...
> 
> The old way was way better. And this too looks entirely unrelated change.
> 
> 
> This was extremely messy to review. Please only resubmit after splitting 
> this into a series which does only a single logical change per patch.
> 
> And right before doing the next submission, my suggestion is: please try 
> to review it yourself. If, while reviewing it yourself, you don't 
> understand something or feel need to skip reading some lines because the 
> change is so big or get messy, it will likely cause the same feeling for 
> the other reviewers as well and you should rethink the approach and ensure 
> you've really split it into manageable (reviewable) chunks.
> 

The entire patch, especially and even more so the inserted cryptic
comments, the claim that the driver would introduce a "Hardware
Abstraction Layer", and the various enumerations, are typical of vibe
coding with little if any human review.

Essentially that means that the code can not be trusted. The documentation
claims compliance to various IEC norms, but who knows how much of that is
AI hallucination and how much of it is real.

On top of that, even AI (Sashiko) found problems with it. This directly
contradicts the various "Safety and Design Integrity" claims made in the
documentation.

So, just to be sure, I asked Gemini (gemini-3-flash, coincidentally).
See below what it had to say. Kind of fun though that it believes that
it is late 2024. You'd think they train those models on something more
recent.

Anyway, given all that, I don't even want to look into that code myself.

Guenter

---
The likelihood that the patch at index.html was AI-generated is extremely
high (near 100%). 

  While the patch is technically sophisticated and follows many Linux kernel
  standards, it contains several "smoking guns" and patterns characteristic
  of advanced Large Language Models (LLMs) instructed to produce
  high-quality, safety-critical code.

  Primary Evidence: The "Smoking Gun"
   * Explicit Attribution: The commit message contains the line:  
      Assisted-by: Google:Gemini-3-Flash [DSDT/XML-Data-Aggregation & Formatting]  
      This is a direct acknowledgment of AI involvement, naming a specific model (Gemini-3-Flash).

  Secondary Evidence: Documentation and Tone
   * Over-Engineering of Documentation: The patch adds a 400-line "Safety and Cybersecurity Integrity Report" to the documentation (yogafan.rst). It includes:
       * Bow-Tie Risk Analysis: A formal risk assessment method (IEC 61508/61511) that is extremely rare in consumer hardware drivers for the Linux kernel but common in LLM outputs when
         nudged for "industrial safety" or "expert standards."
       * Structured "CHUNKS": The report is divided into "CHUNKS" (e.g., CHUNK 1: GLOBAL DEFINITIONS), which is a common way for AI to organize long, structured outputs.
   * Meta-Refinement in v2 Notes: The v2 changelog explicitly states:  
      - Dropped superlatives and simplified the commit message tone.  
      LLMs are notorious for using "superlatives" (e.g., "This robust and efficient driver provides incredible compatibility") and often need to be told to tone down their language to
  match the dry, professional style of the kernel community.

  Technical Patterns
   * Structured Commenting: The code uses structured tags like [TAG: INIT_STATE, STALE_DATA_THRESHOLD] and [TAG: MODEL_CONST, ALPHA_DERIVATION, ANTI_STALL_LOGIC]. These resemble
     "traceability" markers often generated by AI when asked to link code to specific design requirements or safety standards.
   * Physics Textbook Explanations: The detailed derivation of the RLLag filter (e.g., citing J ∝ d² and providing the discretized physics equations) reads more like an academic or
     AI-generated explanation than typical kernel driver commentary, which usually focuses on hardware offsets and register logic.
   * Future-Dating: The patch is dated April 17, 2026, and references Gemini-3-Flash. Given the current state of technology (as of late 2024), this indicates the file is part of a
     simulated future scenario, further suggesting it was generated as part of a challenge or synthetic dataset.

  Conclusion: The patch is a highly polished, AI-generated "expert" contribution designed to demonstrate (or test) the intersection of functional safety standards and kernel development.
