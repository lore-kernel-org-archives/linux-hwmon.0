Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FE41947E
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jan 2024 17:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706634130; cv=none; b=N/7sBVrsuKgU/d4Keub/4XbjTib/BHn0ALEnbcRuoym0zN/rtOoWXGrYl/uSrrDmIgr+pRuRW4Gwv62Ldw87CkT39AY39fwl4YWaUoyEsPfT94uW1J71W/5jRi6Gp9oBe/HDMy0IZnto4/b1AF82JNNhXcMs2zKWYhHgyb6UezM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706634130; c=relaxed/simple;
	bh=UdAWFMhVWskyEezYlWIXrrfz1aIEFDkRzDWmsPFUZaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SzHtrAAfeGN4jH5iNApPE+VEshNtMNZUCbyvB6qdPetZ+mMD9lhxABPDRAIlzfOOGo5jfy9MlIdXipq+OdkBrMno/HoNYwMAcJkKb4upfwEE2wu10cFARDWg3MNNy3/BjvgEXwqyDVWUsHc6Z7vT7E2qWbScuDm42iJkMO42NaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=SOe+KHLc; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="SOe+KHLc"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5d835c7956bso2315432a12.2
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Jan 2024 09:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1706634129; x=1707238929; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UdAWFMhVWskyEezYlWIXrrfz1aIEFDkRzDWmsPFUZaw=;
        b=SOe+KHLc9s+nV30oXVvGcgyUgEU6fEU6EzxntnbJTE+nl3Uc/MEA1EWM22hQoauDXD
         CSlufKASAnZoR5j/LkOtZnceRpnb2A6gdCF47GV3bwv39nFGkynYnDJcNlixyDrCz10Z
         +7YuwOfoZifwJ5aqxP/tqWmoFFa1qRt41fYyWOTIUBrUtJuHcuaxodAY+dhM8aMd12q8
         nIOhBt2SXFfMv+yAuqh4zqnN5owkhsYtSOffyIiMo4n+aZGMVRO80wcMb+k0rJrTZ1y+
         buQx2J65TqYjjXw7eBcvN9RfYWfVSQNMvBLKw8I6zPQTlj5z+SvvhUT6sO33MxVQiXs4
         uq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706634129; x=1707238929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UdAWFMhVWskyEezYlWIXrrfz1aIEFDkRzDWmsPFUZaw=;
        b=lQ6h1EsPbOIqIopuXnDIA+NuQTf5I88t5yWwbgPyXezRauxJDLKvMZZLa3QPF4J8+i
         dr+eUMBef5dZhWWnD76lRPqT4srV6HmNb6Ib4b2QWQUQC59+Maw6fxro4FZPK2TYrXYS
         5nZ2wgdEDaEXDeVxLef2Nmgl0/gweFoSucPPuy8fCHljrjgd/xqhQkfzX+Toyv32SzhX
         3ZpqEnZUp5mG87fdrxkPtXVA1QpXJOyL5uSMR9Be2pqy5Cd8gWUvnrDAIy/USqL8wQzk
         SUXeYyCg3VyDr5cmXYhYrc5YRS/KSbxjiEFXr6Vl5ulmssNNbMmFKNmVZo/3Z5oVl7RQ
         cSGA==
X-Gm-Message-State: AOJu0YwSGkW+pE+2bv9vVlNlbz5liD26KQJm57zuScezCU7kdDrO/4Wx
	z9pHhPQFdq40XTyGgP0phaqV0FN7mUgF8ZZCxVQdIF57/hoHZc0BqPvX7I+bWh8383ViRpMzMdd
	h9aV+8hoZWwTQSlr9jTG6KQifAOMq16/CMkLLrw==
X-Google-Smtp-Source: AGHT+IFOy96TCjteG0UAX6AIpinpu4X7+FOvTpBQjGrkV3nrUYd7/KbDXfEpg9DrREVncBZI0eO5ZXbjKT7VIM62Kjk=
X-Received: by 2002:a05:6a20:d703:b0:19c:b1f0:9842 with SMTP id
 iz3-20020a056a20d70300b0019cb1f09842mr4453505pzb.8.1706634128647; Tue, 30 Jan
 2024 09:02:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130152903.3651341-1-naresh.solanki@9elements.com> <6aa79b06-ab59-4f4b-96c4-bdfb03974aec@roeck-us.net>
In-Reply-To: <6aa79b06-ab59-4f4b-96c4-bdfb03974aec@roeck-us.net>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Tue, 30 Jan 2024 22:31:58 +0530
Message-ID: <CABqG17ghoF0UMU4m=+tQtSncgZUJ7fdk04cjHN4r-x=RwiAWbQ@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (pmbus_core) Allow to hook PMBUS_SMBALERT_MASK
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, mazziesaccount@gmail.com, 
	Patrick Rudolph <patrick.rudolph@9elements.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

On Tue, 30 Jan 2024 at 22:01, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Tue, Jan 30, 2024 at 08:59:03PM +0530, Naresh Solanki wrote:
> > From: Patrick Rudolph <patrick.rudolph@9elements.com>
> >
> > Use _pmbus_write_word_data to allow intercepting writes to
> > PMBUS_SMBALERT_MASK in the custom chip specific code.
> >
> > This is required for MP2971/MP2973 which doesn't follow the
> > PMBUS specification for PMBUS_SMBALERT_MASK.
>
> Applied, but is there going to be a follow-up patch for those chips ?
Yes.

Regards,
Naresh
>
> Thanks,
> Guenter
