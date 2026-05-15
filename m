Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679703FCB09;
	Fri, 15 May 2026 08:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778833824; cv=none; b=vD7GNlJIjaAJhspxU430NTxJZzxnxo26i5x4j06MgUfhLuZp2geqgu5w/U/fe9RUH49OFsD9tJMkdFwJwEcjpFDBxvff7RxH6cH/8S7ZWMBCVX67EEd6jqez55yPclZTUi+U3hgEMtm01XBNpnWBOH1b8gNAqvcoOvCeb1neKZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778833824; c=relaxed/simple;
	bh=Ofb4n8qB8DrSZV9PtQu4cts2N9sLLnbl+ajgvF9k60g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oK2n/CpdHffd4YQ6M58eC0UYTJrxLUip7oyaSFIEiQcA9Im87Z/aEbmC7lvi3UI724I9KbEjkQ56IVF3GR7Y5Nd0rms31R8Xfbc60McGPMsO3FTOwVJKd2kmNzM8zg5k+aBvzsp/0DC155kC1UOXekP2xTxGKcqqLq0D1XNAA/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=CJHrWsPv; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="CJHrWsPv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=2EYmtl1L0cfkIClThKMtoS6tb0a6aFSHr8T5M5+9zO8=;
	b=CJHrWsPvHO2e8bif3JQ+L8ui0G4I5oEWunU6LaAdd8wPgBIInrMsbqi3+q5mw3
	OxINPt6DZOQqODJjXZYh3LqO5oDviVtU+Pp+cuMdE/dGafBtWAAuS4SPUGjYiJJ3
	aZVogOv/NhyrEw794bMQIU7JFF7+6ZiAO7Wr/SJk85Hko=
Received: from debian.lenovo.com (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgBHikh62QZq4bHKDg--.1948S2;
	Fri, 15 May 2026 16:29:48 +0800 (CST)
From: Kean <rh_king@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kean <rh_king@163.com>
Subject: Re: [PATCH 2/3] hwmon: lenovo-ec-sensors: Fix NULL pointer dereference when DMI match fails
Date: Fri, 15 May 2026 16:30:27 +0800
Message-ID: <20260515083028.244757-1-rh_king@163.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <c808d5bf-b166-432d-864e-db0536a3f4e3@roeck-us.net>
References: <c808d5bf-b166-432d-864e-db0536a3f4e3@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgBHikh62QZq4bHKDg--.1948S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw1kuF47Gr13ZFy8uw4xtFb_yoWxZFgE9F
	Z8G347Jw4rJF1fXw1fCws8GrZ2qayDA348KFyrXF15Aw43G3WrGrWvya93Xa1jvFWkKFn8
	Crn5Gayay34FgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUbEdgDUUUUU==
X-CM-SenderInfo: 5ukbyxlqj6il2tof0z/xtbC3xyxYGoG2Xxh6AAA3S

Hi Guenter,

Just to follow up — if we drop patch 2, patches 1 and 3 remain
independent and should apply cleanly. They don't depend on the
NULL check in any way.

If you have any other concerns or requests for those two patches,
please let me know. I'll address them and send a v2 with just
those two for your review.

>>>    	default:
>>> -		release_region(IO_REGION_START, IO_REGION_LENGTH);
>>> +		dev_err(dev, "Unsupported platform type %ld\n",
>>> +			(long)dmi_id->driver_data);

This part I will remove as your comments is clear and will keep 
the orignal but 
release_region(IO_REGION_START, IO_REGION_LENGTH); still will
be remove for it works with other 2 patches.

Thanks,
Kean

