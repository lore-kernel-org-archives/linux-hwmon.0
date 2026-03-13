Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E63C3644C8
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Mar 2026 18:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773426814; cv=none; b=hafCUziS2zXn/POTrjP3Zs4qTPDpXpq8zh3N4UDqIKnG1tVXxBwKROUepGvNr/eYyXP8OBIZBG1kznFvPstlA4ZamnHrja1PX7osVfasj3no6zj+Xa325Hu14vTkgkdTH8335x9Abd5W+bIPiUcGjt9kVF67dnbl1sIOeqeLq8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773426814; c=relaxed/simple;
	bh=EE4YMURcnrFeXffKfUY2x3rohd0IOOyU+TBMAgB6P6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TtuegZKbpZeKZsWynxCWTyYglOMHTxh0cbwlailYrtnAXbjzgF5VtaceghWtG+ktT5MVKSbKKFEkfPieael9+atBQ3snGcoXatTa0uuQMtXRoX/f3sA5MPiYz3XopwWSknP8VXpe1TqQYjt1jkFCTJrf0lUeTraNTjEYCpG7eiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSjbmovz; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSjbmovz"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2bdfc4b191fso2891343eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Mar 2026 11:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773426812; x=1774031612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pzcme6Fc7jwKa30DLKkBMP5J+l0OEb6h4cy20gevLw=;
        b=CSjbmovzMcmIoIBVtN08uajLpziVXK0YujT0jX6y1h1tenKNsNrO0Fp7J3fpHH+n+J
         xhaFVSYMrjB3fPsFrE8qQGRKgFu9jbzo2WHhThclX9W6RVBvufVS7XltQwZcdibhcBhH
         w600R1DXCJvLcCjAUN5A/xHQWsnySIfYIqgpCTup/q4HdGnPQ3XLQmXz0JRGWZh5+jqI
         6HESLjQHc9m9uOTTQ15pV1GxsZRH2aOunJT67Xlv7hL/CmmDgbWQiPIxNDrBOKN5OIXk
         PWrYhHIhJe2ogLy007K6jz87EygVSkb8PHF22hNyjXQj/YAZhLBxpbwykr2rVyI4URq0
         FZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773426812; x=1774031612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4pzcme6Fc7jwKa30DLKkBMP5J+l0OEb6h4cy20gevLw=;
        b=bLchzbmyUFlrp/8kJHCKiJZ9RqgmVQqZEcWJdfds33hXmPQyU8LJRlOmKalPzxfPik
         5cGodW4YTU5AAxVitmQVyjUoxALy9tPYLxwWVDxSsm989KaGFlrRfmMgVqiiFBQwwmyX
         9aKSx9thtvR0nRivNdQg82kiH4xn3OsqnnFGlmAXATJGktFK/XeHzvTeE4MjBry0NWOK
         0ZtIkM5/JaVsioRY1yB4cdHz3VJbLLw+WfW6cQFr8pvLwfqbWUvcF+oMEUV6vLaRyywB
         9tz388av+lsfWubQG6ml6zvJHx/7r1LxijAZFwwHkuwUVQEePG9bhtNSeDs3Gf240rh9
         JRAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrwmTUz4cNTv3HmfkL0PR+dj7nORHxzapTroMAfkl9NF6ZuphFqwC+/qLNe7dBnKBkvJm9yUFBp9jFiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg5bnNVwRrc9TzT5pGOrX/p6e8+dO9cj4oKJ4eKfs8U5unzavK
	tkHLnSO5a8suKbU2GGl0S+QiLpcO55bcEGwm+a5WuG0SeLV09/Uj1zOs
X-Gm-Gg: ATEYQzwp0wIQ9mZXYC3q0B1zKUQRzRpWmhP4edOz1ERyFz/osWOJjTcjtGB5LpY1fSf
	YiPGCy6HJEC3GNpwekhZa1oHYc54asU0Jtox1+VB8fe3fmJtoIOmz+xVAdgvSpuEhUQJoYnEiBs
	As+4vErP5NJLsKDnyRw+PjcOY6n/xjoNNz48XZTjFD0TtBcTd+4mfXDp1SPNpFRQyhpLlydMBXx
	3ekB2pT7QCE9uXmtBj8wKTNgiTz6pLGdtXGJYC4yLctl6w6kow5CiDTmo73a4ppiKy4VnYLEobR
	2i326IhkCzh3wJWcxtM6mLBq2wNU7BIkE3csg0hBUtgTEHHqHjB0Vji1KY9VMAxBy0kBia+8uo+
	ZKUkW6x5Dt1E+WNLKLOmUG5/DuKx7vnEPM2VOAO3furIHpvMCh90xzjynhLQMxi4A+hKN9/u6NO
	z99BPHNQDLMp0Y/KfjJwaBjDeys57uEEm6iuM8
X-Received: by 2002:a05:7300:8b83:b0:2be:2964:44c3 with SMTP id 5a478bee46e88-2bea547ccb8mr1887830eec.10.1773426812206;
        Fri, 13 Mar 2026 11:33:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab3ea2cfsm4170626eec.11.2026.03.13.11.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 11:33:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 13 Mar 2026 11:33:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Dell.Client.Kernel@dell.com, pali@kernel.org, mjg59@srcf.ucam.org,
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 6/9] hwmon: (dell-smm) Use new buffer-based WMI API
Message-ID: <07346e6f-8764-43f8-b63c-31dfa9c65add@roeck-us.net>
References: <20260308200155.118950-1-W_Armin@gmx.de>
 <20260308200155.118950-7-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308200155.118950-7-W_Armin@gmx.de>

On Sun, Mar 08, 2026 at 09:01:52PM +0100, Armin Wolf wrote:
> Use the new buffer-based WMI API to also support ACPI firmware
> implementations that do not use ACPI buffers for returning the
> results of a SMM call.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Acked-by: Guenter Roeck <linux@roeck-us.net>
