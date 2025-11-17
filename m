Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D7E309DD2
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 19:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763406255; cv=none; b=AmZPfu5VGrwZT/e+YN3IeTcF5/d/a36IJOdknc2V05uEd79GlnWi0qAxfnD5OxrCcyFGFAutj03SWJzHqA+6YPzkpFk6BFfbeYN+dOUXYi74ypnUdpP90YGxAQxrW8rIVSR4q49j1EWeWlCxw98UAPwYYdI9rxKKDJJftZHuovE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763406255; c=relaxed/simple;
	bh=DULgiLn1n+M4oKEoPKEiysecVrQjt6o5EGuYgmk/cJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKTRG2lDxXwz8smwWEnjCRCVY2SPeGIr0VGX7zEgvp/PP4Y0RW3QriZvZzstbN8gMyBqITTuqHj+s4a20v9IEik1QxaNFurjNn/Y/LSj5C85aeFMKAHQLMxagYoEFrElWSxB7eX2I8ez/1pHhKUclgFP5ZR2pLb7WVtqtThnqWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJUYxGSN; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJUYxGSN"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7ad1cd0db3bso3951073b3a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 11:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763406251; x=1764011051; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fuOrpOQ8gbQIRe9F1vMO9c/+fy1uIVqyfDe84OhH/7E=;
        b=FJUYxGSN0jQkfVdwqCNvEF9QRcp3cGG40RsQ0zfL0CBHvfkjpq9R6rt18RJakj/MGn
         qR+/qNs1biYI4aapo5Ac8DO1g0Cv6ZZBCBQUz/veSP104LpF5h2GSBOjH5U0J2bdqQdz
         Qsk7Ypw6bDfVav9XupGq5YLkPqCgb3CQPWoUTf3jpCOHUXHSfqU4hjMphgEuQvW2HNGJ
         ua8ZUjHKZ201yb6awGde+68qxlKcz2vrhM71H3CTIG8K2knPxhu7D4heLLJ8Pw20nFZf
         46lJww69s/T0ZfJkrUKNIGcMabIISK/D2iQDM/sRS8yHgCmiE11rEkt9gDCmKtuAgbLc
         Aj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763406251; x=1764011051;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuOrpOQ8gbQIRe9F1vMO9c/+fy1uIVqyfDe84OhH/7E=;
        b=pNwi0S1HlQrMd3Jh93MyatnRRjBhYEcfspQ9bV7tSUZLnJLDc8PyaRXIs72tAzpKXM
         Xv0ehmBg+0nFuwIPSuADQK/603wW5FAbyqTRU1uLJFSiDfQ3AEHtfAEBx6h5Jp7EQvhu
         YdOt/JQ6PGUPJAN9SuMmMSaXxH7eGEwUPmmq0PLBfeOktC0GEFQJji7o9CPopLl3aV8P
         /AghtPvZhPakyOZcRIGPp9f5Nl7Ut9rZNQTiHbWn2WsgPFnTuDu5dYA0enopfqXzF3o1
         GiV/MfTpwSST3tCHwNgCsQ2mlBLpQIMJ0Wbgp4J5BwXGraVw8zATWuR8BIwd/7JyQOZy
         HvyA==
X-Gm-Message-State: AOJu0Yxdghkd6OE03W5mn/NMHVgitpB16EaJIQET/FoWm7dEnPRn31Un
	GLP8Uwzrkk11NFNnF1ZtgluBYDUDuBnrBYRB77F504Jyhf3CBbW17bf+v2m12w==
X-Gm-Gg: ASbGncuk4Booew5q61UOi3H2s0uIn4TBRGum4YRMc80Sfr+EwCoymzMp9eT9pdlrPzh
	LN3vZPjTHjjLf4rfrLzQxiskuQ3iQzzk7vFyr79PLxS6Cbr+voLQtqh4UlIpa9+BuSXv/tqBgfa
	E/wkNWEozE8Y6qIR6IVad8qKcCU0t59yV3ILl+8xbZww3feV5hPkOtJbco7n+tBazAXoIWeMwUX
	FlG9JPTrIi5xsbNoOLbE9W7tgfcVv8IecMQeURIoDpDTlB1XHXcR7TWhJ96mcEtqiHH9AOHmliX
	+9lzHi+jtCWPsUC+hVA1Y6aizyu864nlYdHW0vq4JhATwZ7skaDE7nm4frR6rD8G1QD1nilRVPB
	ocRv7OhaCSQyZ7hoMLfbOqLyIy/bUZFk8/T0yPhrAXQcZPr1pNStmvw/uCLD04ygUXK7STJd3pv
	u2ADy38xecoY7sGXhcpRF7HeHhB8KvZKJMEg==
X-Google-Smtp-Source: AGHT+IHcNVm5cZpzQHisJS852+tfRoe2DwjQOLZiNBWZIJMktaNP0KGScn00mqrWdfjKO0x8dniupg==
X-Received: by 2002:a05:7022:698e:b0:11b:9386:826d with SMTP id a92af1059eb24-11b93868441mr5693652c88.42.1763406250596;
        Mon, 17 Nov 2025 11:04:10 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b06088604sm53005912c88.7.2025.11.17.11.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 11:04:09 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 17 Nov 2025 11:04:09 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
Cc: linux-hwmon@vger.kernel.org, Clemens Ladisch <clemens@ladisch.de>
Subject: Re: [PATCH V2] hwmon: (k10temp) Add AMD Steam Deck APU ID
Message-ID: <abf888f3-5403-47f8-9b8e-9dfd474782aa@roeck-us.net>
References: <20251117.195048.691713748773231900.rene@exactco.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251117.195048.691713748773231900.rene@exactco.de>

On Mon, Nov 17, 2025 at 07:50:48PM +0100, René Rebe wrote:
> Add AMD Custom APU 0405 PCI ID as used in the Valve Steam Deck to
> k10temp.
> 
> Signed-off-by: René Rebe <rene@exactco.de>

Any chance you can fix this ? It seems to be common with your patches.

WARNING: From:/Signed-off-by: email name mismatch: 'From: Ren� Rebe <rene@exactco.de>' != 'Signed-off-by: René Rebe <rene@exactco.de>'

Applied.

Guenter
