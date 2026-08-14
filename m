Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327E649504B
	for <linux-hwmon@vger.kernel.org>; Fri, 14 Aug 2026 18:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786731638; cv=none; b=RkrLiPjmPsWGJGRSgzn60s9ro86i37deLEGAR/GvBiu8OBElezc5LXsaZJ5x1jntO0TM9Pu3xdSryHS4AtVUUZan8PGw+sH2GXCcJ/rfK+H3cUFUXXFLlsuw7bKrZAAYiPc4Hvuf/+nQqO+YNRwnz8ot12EurM88ke2W7KSSAP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786731638; c=relaxed/simple;
	bh=kuqNhqWbIiQdR4l+57aL+uGLhVvHIY32NCV9DcATX/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NSg9+wYundf37duwTfpjjDnzI/hlHfy9WB6dTRbOEns5fr2d8b1qEDFkQ3Q9VAtAz74NRfAurUsdcyRJ0kuYW6smg6jtLIHv4e7wM8zvjN7JERsfPgG8TxNwVCsgT7j+0If4zdcICAsoV7sWACd5+ZV6pYdBKl0etvvcBVhtFwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+T+ulzf; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+T+ulzf"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc11a30a259so392551a12.3
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Aug 2026 11:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786731636; x=1787336436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d37aJOtG5AvFszJFKSyu9o54r64uWVb+xegUaUEkkBQ=;
        b=h+T+ulzfFK0MnsrW7pIE/kxUHGzrLXlgY4RjKalrXZWNIalZ0shHYJyQTjIJ4JWUkI
         zVd+6+lOVeMgvXcqRRb8JzxOCL5gnLGqFpOcIPvWEWSSYdf+xCG9f7gkMCFBqbDVLtt9
         rAs20ZPs5wFygO259o6V14fFISfkwNuZNXKlwD+5WaS/hgrdzolfEzTNjZ7SQhehrT/0
         Fwz+RQLSpFbwhE1E2vTVXOnGCt3SdmwlRuFigSaAACJd+HSbjtCXzraVHbFKwhE4hNub
         fgD8RTSH4rugEimjYUiPCir7dMRGrfYg9YR8XA4A1LxIPoh6I77r7bC2NKD61GdXCSTk
         dpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786731636; x=1787336436;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d37aJOtG5AvFszJFKSyu9o54r64uWVb+xegUaUEkkBQ=;
        b=XDkUwt+iThcgf1zs3aM4oAsWoxCgR6wlWhw9ZgYQyOuj13sY45LxNpqhFHwvkGxh3q
         3MfjQHLAwIL+tPtTK7O+hzQiP5eoGjQPVNDtMxME3SlBwUpr6f0uWiRKbIjPJcxzTsz2
         VcFn8N10zycfPaLsX8vuyHepEmBEa/4tdqbcbX5QUGfsprumqJJB3nlCjSBmeHnlFPtH
         5fQTdwcZLnK/NGp5QLruX8fXXCwJ5RBU2CnRSrSwvVM9+aOLeDt1EQuGpjtneE0rd1OP
         dylgda6Itb8Fu1FBiXZBl2UhrGkPqnLkGsIg/9i2ycjnvVLD9AstfGHnS9ApT6xJJFgw
         /MQg==
X-Forwarded-Encrypted: i=1; AHgh+RrjXuaxDxFRqsq3YynGEFRkwVEPUzLVR8X5xvcQERqSA1tUCUz2uLOE+IVAWwpXHWNuJJB2Wsj0RZSoFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmD8OQz5urQgtQy3klJ9hwZOEQoQIpnoJAPCZIYEqRCVw3NVOg
	rw6a8tCCzkkG6pLwUhxgNNhOORHaQj4DpDn8XdRrq4kEKhxpBS5VtUnsS5AGow==
X-Gm-Gg: AR+sD13x841J3IQ++QYz1p3hoEHiSH5Z7tyyf3/oIK4QWZ/2pA8O5YbrB3qba39a2st
	5LZnFedgdOvPGAjiBn3YUei1chQTg2xAcwDCqQXOSy2lER8ffEWU3wFOyRwvFNYW0ahSgBYBmQv
	FTcDY1+HNhlZltpZ09FSC3FkzZBcxVYLD1hagFRH4/sV6C+hg1W1Wt+AZNwSRptcRDFJBeqlybj
	Kh/6lybZhHYEMQbJ78ogqV5T2GSkj9rwU/+4px9mTIYU6lz/4umuPRyQcGG8rRmbS1e729EytxX
	qcC+Y0HKutvNOva8DStIik/DOKR2aMNvQmPpLQBdlqPVrIp4UieRL8LQtN4hz3ToUfSYUWCLnVH
	EkiPsqyb2tRdysyNJfAOcUK71lFvBE4P2o4KDIMrrFFB3POYwXxdQO61aTT2QT69DQznS1TVBCI
	L8eSvtbGWsgs0AZpBMLZiTK6BG7uLWPexloJQKQAwFx3klhTOpAHRjUnrUwd3u4ychqmDwF7d0Z
	g==
X-Received: by 2002:a05:6a20:3d1a:b0:3c3:875d:c52f with SMTP id adf61e73a8af0-3cc71b65952mr9149175637.10.1786731636363;
        Fri, 14 Aug 2026 11:20:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d60eb8eesm6916587eec.10.2026.08.14.11.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 11:20:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 14 Aug 2026 11:20:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arie Miller <renari@arimil.com>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
	Will Smith <github@notthatwillsmith.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] hwmon: (asus_rog_ryujin) Add per-device
 configuration
Message-ID: <55c7e267-b5c9-442e-9127-a4195619e03e@roeck-us.net>
References: <20260812103532.395049-1-renari@arimil.com>
 <20260812103532.395049-2-renari@arimil.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812103532.395049-2-renari@arimil.com>

On Wed, Aug 12, 2026 at 06:35:30AM -0400, Arie Miller wrote:
> Move model-specific report offsets and capabilities into a device
> information structure. This prepares the driver for coolers which use
> a different report layout or do not include the external fan
> controller, while preserving the existing Ryujin II 360 behavior.
> 
> Handles an issue reported by Sashiko where an id could
> be missing driver_data.
> 
> Link: https://lore.kernel.org/r/5a817284-a9f4-48b2-9f0f-802c5dc6963c@roeck-us.net
> Assisted-by: Codex:gpt-5.6-sol sparse
> Signed-off-by: Arie Miller <renari@arimil.com>
> Reviewed-by: Aleksa Savic <savicaleksa83@gmail.com>

Applied.

Thanks,
Guenter
