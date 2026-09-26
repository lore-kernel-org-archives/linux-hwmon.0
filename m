Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC51283FCE
	for <linux-hwmon@vger.kernel.org>; Sat, 26 Sep 2026 03:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790393348; cv=none; b=rsCmbT2Vqfo3jNjZiYhopNd2b/jIMBzIgT7QTHXwC9Zc8P/xHs95VVOxH5tCZ/5rYjaN8PJjC+ObYbnaKv3R2JQrjTj3fgLSYqrTQBcZp0peCny1vPLoX1tJRLocPw9stBgWXKKPRTqbr/3bBUtnS5mX30q1uK1Ner3TE6ZSSrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790393348; c=relaxed/simple;
	bh=Znr7ARt1iJlguBK9vtmL9UXuuyNNrW9/zWqJGcZ2yuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyw/6dpf/hNzD+X1EGZTUnXLO5R5Kb0l+lnObIPH60XU5RGSSdKWlH9k5xBcKg5AhWmup/wloyr7pbeRUcD2ol1AComf/dxpi3U1A+oPz9JEtZcqfyfv8z/eXSnwlhpu2e+MjDbPsQhqKgYRgG9CYMIsUbNz+uNb99NE1eOf/xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SUxVad27; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUxVad27"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4d2fe2056so543460a12.2
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 20:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790393346; x=1790998146; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kiq99/bUySCbDDzsz5gCxAmvyRdZYaOERsW+1tODmAQ=;
        b=SUxVad271vm8DQ0rhf57A/6pZdycksqKKoQVO2Mh6BD8GMeqQZyDA3pH8HAc+9lB6J
         gZ6yTX8uBlXu5N41YGmhp6bYe/7Gt2u0ZsgNA99dnGdVSUrOc/HH8fH7fzQLgwDYNRU5
         NZ/3P5b4nLek2+DfIGWoz0IKhJEjy6GXXRmd+5VV10ikVlE/wUxZrrIN84DBUZvdag54
         NCWtrLZGrEWIGACiPxBK2QAFZNSgF/aw+VwbYQYiHdahkWZY6B9vpwfbwMgI/jzcjaja
         qTKRz4Apl0ktEE3h+F4hM8Z5TPr1MhW1OhzMj1fK6lEzcABkYVy2JaBIZHaPVFSuXRYL
         Gf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790393346; x=1790998146;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kiq99/bUySCbDDzsz5gCxAmvyRdZYaOERsW+1tODmAQ=;
        b=BsvCoLaKZv9cfAmtqf8w1pdr8FiAxTHCtHoVXzXCVMuflZAo+DYxXVMUEcHM/OLm5T
         Q6rMTvrFVO+sI6QHdGbnlb9B1vB01s4z+id3yvYUielJ0sOV9qhkhaEmpUveLMYnD4vE
         EV9vU1ODeszLMUgSHksvia8Jp47rzqKfeLqTcgMKzSMM9VlWjJPtP/IwKrUZMus2xlAc
         mzlnOQwwNaJkpxVRQfsPt6WicKPlul9LXyBBwW/ERb9ci0wvBKHOVz2/9LjnEZsJpt88
         hkoBwWB1/uLlch3xfF4zNFqkXnr3AWR8+mWCe3LpNvmIapmVr/fNMYC+Ra3yDKi/SCy7
         8zug==
X-Forwarded-Encrypted: i=1; AKwUvBzm87oHlPoFbbfE9Vo8a8WaKVdXbU5ir4cOPjTD4S2I9dx/Dljo8v02StI27MLT5Y8yhqDMcDa1QP7p/w==@vger.kernel.org
X-Gm-Message-State: AFuF++mkdRE/Dto7FzTdN4akTpUg9pugZ64hLPRDwyFFf0oF35UohQgd
	vlxmsFnkFAdnTCQ60iKqYOLKWg6msFleJYcLjYHj18WqB2z3sDgzAQIj
X-Gm-Gg: AYBFou1LgG2J3UBCeG7pZlF0+0MSLZ6um7Ou83toJ+eTZMx8CpAyQ+gPUqA+Eiv4XQg
	GymMJ/Bkb4mZzMfI0riam3ICFSQPpm1F0FvZBoxP27JrFI7+V/bCND+PILL7hbDo3uJCUA2S48I
	ffU1fBGGsjkfZdZCCRzhmpm4hwHHY8xRIHmCAJ2AtsxC4ej3lZmdEnEP11JmJKzxYHujr+UXtWW
	uCq7ZHRLt6nWqS89vDLhVqgBYB1HndtRLoQvfDWUtTIBF1QfrQXA7kmAVcu/DxBTfgyvtb0BkeI
	HSt6yWuu0Ui/QZ04Z4bHpGRKmVos1kTfXoKnRD/XQc5/Elmndtky20WtjrID7nbqCemQzMGgGxl
	G5iLr459sMOavJxL/sdcoZFhpgjAkidz0CsD30LR+vFxVlTyutD4JqRUbVNPRxxXKxSYv1vTHp+
	u6M5zZ2x0NreELiOs+KHuGLVh+ftTYGM+T5vChzgJYbO6idPwtyd63Frw2OlSZrVf+FtIlKp31/
	bdFgRMvAAGCJf/flq6x3/E=
X-Received: by 2002:a17:90b:498c:b0:3a0:903b:f253 with SMTP id 98e67ed59e1d1-3a09875d77cmr6186954a91.18.1790393345982;
        Fri, 25 Sep 2026 20:29:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0bda430b3sm6734490a91.0.2026.09.25.20.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 20:29:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 20:29:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: Add support for
 XDPE1A2G7C
Message-ID: <3ff0d983-37a8-4862-9019-478fb1488329@roeck-us.net>
References: <20260921065702.93196-1-Ashish.Yadav@infineon.com>
 <20260921065702.93196-2-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921065702.93196-2-Ashish.Yadav@infineon.com>

On Mon, Sep 21, 2026 at 12:27:01PM +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Add Infineon Digital Multi-phase XDPE1A2G7C Controller to trivial devices.
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
