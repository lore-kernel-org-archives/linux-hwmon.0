Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9357550276
	for <linux-hwmon@vger.kernel.org>; Sat,  7 Feb 2026 05:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770442263; cv=none; b=CGvaFRYhMYZlKoqdJYIdAHtU8RbgA5As8CXjwi7cT2yH6M4cj8yNm8SN2NFPlokk7L3xFPZFi3Rc5oIbJIpaH9aM1a4UIOeuhdmqg3+m7PGxNjg9444QBnsDeXBx8Z61jiK+HJuVtbzssvSFXRCP1caFdcH+jRV62Y9D64X7nT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770442263; c=relaxed/simple;
	bh=6CMcImivz+9TGRX6cDLBO8eka/508xuj+j3Oja7JGm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hX9bL1zJEA+UvGkAub/6ykzHOeL1ci/IiFj1qND3wCjk+JBgRqu6QqkncwEmisbPBQVsjh3JQiwMiYFUILOHF6oZPWFecvQ708ho08CXsBeMQepMUxfMG9b5z9ZMd0zfgkhNB7fQL7og0v/yAuX82ibdp6kj0AkSri7ciQeTXhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbeFA12x; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbeFA12x"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2aad1dc8856so284165ad.1
        for <linux-hwmon@vger.kernel.org>; Fri, 06 Feb 2026 21:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770442263; x=1771047063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4r1/bFgz7fHK5C32YZ4rSXfMrTJXSkBGVxxwZofFjNE=;
        b=WbeFA12xzJuk376PJZiXUbBxj3q4SsX5K4+QwxVDAomx05MQgsnby172h91hcuUfLV
         NVvVky9zL+ugNcK2x+F3+7NTEsbymg5bRLirF18gCuscXZusUCNRAbrGv0ICVhPxBuza
         wYql06qaBmonB735k4QT8N3BBSPsL7t9iIB2t856K+ckoA0Ir5cYTx7P09NaCcgMH28k
         EOmIf5wbFcreXagevUeTrypxW1v7a2b/HGPDhnwWsQBvAx5d9d7n/1SRWbrbM8bAn3Gg
         Lek7CT7Sxq5Wl47rVVfvpxwu/vdkXlG0MpQ5sDBTiURB6p4QsCj0WVLPaGH78EWVDsd5
         ZwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770442263; x=1771047063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4r1/bFgz7fHK5C32YZ4rSXfMrTJXSkBGVxxwZofFjNE=;
        b=m4uVcdBeQOFlg9uiZN6BlhDmcuQ/a6p5VqTAk1/aL7OsfAt2d7oG+o+Ug8FsKxvpRe
         SmdIKWFElN6T3vZhGnjypLuUAWS9g9GAPzhuvt7rom60J+rNY+Tn8+Y8fnMDUdHEspWo
         AC7TtmeERvLJ7ehUMv8x7RcHBKmZqOqOId704MRaKBsxMgZYDDD1pk+UHB80gyzFUQj6
         2S97ge0q/OiJMWh2rwqZ9gshfYjagmT9UR3rRBdvi51Wt5vhvD3k5/tRYs+tydkTW+EA
         0zLSjCeqMb9x5qEzZUwZ0OOZWwnB45MFPj6c+HgnkoOwVd664PeoVxjaRbz+MWQfq64G
         t+VQ==
X-Gm-Message-State: AOJu0Yx+BLLV0QTMKhXi+kaifhCYnsFApV/6kRWW1MWnKWnmKIuDtwpm
	E4tz2FV9zYi43xPHp8xh8H7J9p/jqrQN9GN7IcfwnJMJPzrpu6Xog676j2EUc3jN
X-Gm-Gg: AZuq6aKLRY4br8wx2wzYV772elRs/9FBw1rHoB6jOfuN0OQaDHBwQGKRj3eygO/dhdO
	fEf4sKhxyM+CGBcxVrpNb4qycM8pp4x2eq7d8bWXzYBO0fKdojl05niqy+1X3spwZCT8tMcB8Rw
	KpZPMFn8x79MA1p8uxiKUMLkOHiSN3OSl0EaPg2o6d1d4+hLcesu48iEWQhQSfma4gBu5Xd6v9s
	otE1Iz0D/47GIQSGn5vGbFam2ooclwSxC4UotRhFGbGmQfCjhSHOmcFmMZWlXbW6QpiThRxWklX
	hJWLfNPXBd/lft9xERf1/3Vnfv98eUx08ZE8f0ZYgREjXtMESelYAAsquj9sg/6zLSesOyjYL09
	1VrmCkd6OZesfRAtRlQA1Ey8/M7/Xp5DCEGV3Uo/usZ/O1GCXe8T7tCtpGVxRDiAtTFqamAh7Sn
	mpRHBfDs5RyijmP7mNQipFK/WRab5FTbXyK4ih
X-Received: by 2002:a17:902:cf07:b0:295:5dbe:f629 with SMTP id d9443c01a7336-2a951608c6bmr47072025ad.8.1770442262725;
        Fri, 06 Feb 2026 21:31:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a96251b6edsm10731145ad.69.2026.02.06.21.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 21:31:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 6 Feb 2026 21:31:00 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com, Ben Hutchings <ben@decadent.org.uk>,
	stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (max16065) Use READ/WRITE_ONCE to avoid compiler
 optimization induced race
Message-ID: <3d81c0ff-bd80-4b06-9a59-545b5d94e6a4@roeck-us.net>
References: <20260203121443.5482-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203121443.5482-1-hanguidong02@gmail.com>

On Tue, Feb 03, 2026 at 08:14:43PM +0800, Gui-Dong Han wrote:
> Simply copying shared data to a local variable cannot prevent data
> races. The compiler is allowed to optimize away the local copy and
> re-read the shared memory, causing a Time-of-Check Time-of-Use (TOCTOU)
> issue if the data changes between the check and the usage.
> 
> To enforce the use of the local variable, use READ_ONCE() when reading
> the shared data and WRITE_ONCE() when updating it. Apply these macros to
> the three identified locations (curr_sense, adc, and fault) where local
> variables are used for error validation, ensuring the value remains
> consistent.
> 
> Reported-by: Ben Hutchings <ben@decadent.org.uk>
> Closes: https://lore.kernel.org/all/6fe17868327207e8b850cf9f88b7dc58b2021f73.camel@decadent.org.uk/
> Fixes: f5bae2642e3d ("hwmon: Driver for MAX16065 System Manager and compatibles")
> Fixes: b8d5acdcf525 ("hwmon: (max16065) Use local variable to avoid TOCTOU")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>

I don't claim to be an expert in this area, so I ran the patch through
an AI review and asked it if it is both necessary and complete. It claims
that this is the case, so I am going to apply this patch.

For those interested, I attached the AI review results below.

Thanks,
Guenter

---
[AI generated]
Summary:
  The patch addresses a theoretical data race and TOCTOU (Time-of-Check
  Time-of-Use) issue where compiler optimizations could reload shared data
  (data->adc, data->curr_sense, data->fault) after a validity check but
  before usage. By employing READ_ONCE in the reader functions
  (max16065_alarm_show, max16065_input_show, max16065_current_show) and
  WRITE_ONCE in the updater (max16065_update_device), the change ensures
  that the compiler treats these accesses as volatile, preventing reloads
  and ensuring that the value checked is the same as the value used.
  The logic correctly handles the "lockless reader / locked updater"
  pattern common in hwmon drivers.

  Verification:
   * Concurrency: The max16065_update_device function holds data->update_lock
     during updates, ensuring only one thread updates the cache. The
     READ_ONCE/WRITE_ONCE macros correctly protect against compiler
     tearing/reordering for the readers that run outside this lock.
   * Error Handling: Error codes from i2c_smbus_read_byte_data and
     max16065_read_adc are correctly stored in the data structure and
     checked in the show functions (via unlikely(val < 0)).
   * Code Style: The changes follow kernel coding style and best practices
     for concurrency annotations.
   * Regressions: No regressions were found.

  False Positives Eliminated:
   * Self-read in `max16065_update_device`: The line WRITE_ONCE(data->fault[0],
     data->fault[0] | data->fault[1]); reads data->fault[0] without READ_ONCE.
     This is safe because max16065_update_device holds the update_lock,
     so no other thread can be modifying data->fault concurrently.
