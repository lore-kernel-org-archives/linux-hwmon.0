Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC2B402B8D
	for <linux-hwmon@vger.kernel.org>; Fri,  1 May 2026 16:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777653409; cv=none; b=faqCtR5lpzSbrQbG4h/TzbHos3H4VJKla4sK2ZY8LgxSIslyZbFD5jH5qd5jsCoTu/qyB8uun0yjCsSUV4CgAv4ZGQzLUCPX8uUAYU3CDZ+UuTxIV7Jf5PzttYS/qpWpD4Mmb95gT3AFSs70pX0I7CiX42xP+lRDTsMb1DJybqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777653409; c=relaxed/simple;
	bh=XbHuBazdIj59lFJGTiZLT9rr3cfwwaeJixTzB2ocrQE=;
	h=Message-ID:Date:From:To:Subject; b=b7hLNcOyEnWzowsgL02IXsehBnVYr+XkG6crQm6hUmk00eORjbPph9RGBYggtgU8KRoybUbOSG9QuMtMitYOtMV3qspZ0SY30Z6HV98Lt61t4i9Vtc6CBKlula58TJSvTvPmXYkAydCWaTsXixjAFlpaPzpFNuNd1SjwFKCXML4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7M/zbg7; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7M/zbg7"
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8d67a483d3eso237935985a.1
        for <linux-hwmon@vger.kernel.org>; Fri, 01 May 2026 09:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777653400; x=1778258200; darn=vger.kernel.org;
        h=subject:to:from:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XbHuBazdIj59lFJGTiZLT9rr3cfwwaeJixTzB2ocrQE=;
        b=X7M/zbg7fKeKUOw2lTmzkFBlgILrW9zoE0dHsLj1GlwVYfOUYe+aY0zTl0BP9PC6BL
         86T+Q+SjX+FoJjITNdsBW5s9IIpibyHyzoPRwqO5RMStE0pP23NQn2gPsQXl6lNeG3il
         5FKPMgk0OLqAT+nOWjHUZWNLC74nw/2ppcb6AcDkg1ElSs66YpSn1BuoPxeJnqh48Wtk
         7wcfUatUjypbqRcyfIwzXbVQRFrkafZljnNE2irezw4HyozeBlL0Mlw78mTnNjJp5ZAA
         4lDlyxawHY9NPSZPrER4bfyXJUCyHstYAQV4YtVZu/JKcPZBLJL5fjpdbxjzGisp5kJo
         mAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777653400; x=1778258200;
        h=subject:to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XbHuBazdIj59lFJGTiZLT9rr3cfwwaeJixTzB2ocrQE=;
        b=SPPxEnCLu7aoxU46GMtU46cnWuQbWF639ReM4TVJohFgeBvvf7ZfZG8dKfn4rFxvWZ
         147eTSKiw6rObM8f6h02pSoSQHPDXu4xVhz+B//ZiK/qvTKwI9E5eOo4UhHU0HjWWWZX
         bmY2HLh3LyYC3zDYWq1MNhWyYTUlw2Q41vo3Aa7AuNH9FaNpjccWgVy6R7FWf/gcJJVt
         yJ3gnm472aoaq0rhygYHmVXKwRjGIxXVsvhASOEuceWEo5gEF1S7w20Upz7y8LkS2R6v
         mr81enry6rE4uwifLXjNYowpBnio4PVZ6FCNsCDrxrSFmP6wMKRZgZdgKVkL4irnTovV
         DpUQ==
X-Gm-Message-State: AOJu0Yz5Z4z3I6CF6KMaBoQn9vzlVtlbtE3jqf/jWgSP1DwyEaZdrjQ4
	X5+ZkA9Eud9sl6kyyZu/U0ZO9R7ZDk7O5WpPv99VrngC4WMnQPfI/asBFhInrExxWK8=
X-Gm-Gg: AeBDies+ZeAMlpL8zVH4hoeJiVlNxOP7QJrWFkO7CdYu5oaV1TZhLiktXkJcqSKaNea
	gsRQYEwdz8uofkp8Il9S6BYxmG6xdKr9dw+FLBQHG/P/9fIAaael3cAZDbubL6GWXeUtFrXNIDZ
	oRuY62X+supWfSm6u0kY7EfbEAf7l40J2V++lR5K8WepHxROPGwKVC9MLecNA5Rp0t+hbJVUpsK
	Nz9qdDRP/OforhS0R+Fz1FNhEW3x5os0OkFuY+T7guUyU2RKd54jFH0eGkPQhkKFlzp+EMDrY3F
	wojwqk37n5VObNCUNu00SU6tMXoqR4JKatz8J0Tt1zZyUpGy5ucy3bK+YiD/lBWXOAZrymPd7Jd
	IFOSXw/OlkzxPr73W3DwiPuk3r3fgpc/jOWvgZe6UsvzES6Avt8qyV2FKUYFQMGc6m2/0FRPoMW
	eO+ti7aM/vnMC9d1QgkJlSJ6K/jEN2/oFQlmdHyYzRUqMXpY+6+1/bSVN7rfeIVVvfTV4taWxX9
	D5fADOcrM3VXho1377s6owVSi1Ft5anythOBx+Y5FuNiVfkBVSO
X-Received: by 2002:a05:620a:4706:b0:8cd:a252:28fa with SMTP id af79cd13be357-8fd158e57a8mr23046485a.4.1777653399498;
        Fri, 01 May 2026 09:36:39 -0700 (PDT)
Received: from localhost (ec2-3-149-8-194.us-east-2.compute.amazonaws.com. [3.149.8.194])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-8fc2c91dd48sm204932085a.38.2026.05.01.09.36.38
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 09:36:38 -0700 (PDT)
Message-ID: <69f4d696.050a0220.de9b2.0415@mx.google.com>
Date: Fri, 01 May 2026 09:36:38 -0700 (PDT)
From: mezabinsorifa@gmail.com
X-Google-Original-From: PayPal,LLC
To: linux-hwmon@vger.kernel.org
Subject: Your Ticket 17CE6EDC payment is processed
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Dear linux-hwmon,

We hope you’re doing well. This is a friendly reminder that your subscription with PayPal,LLC is scheduled for automatic renewal on 2026-05-01. As part of this renewal process, the applicable payment of 439.85 will be securely processed using your current payment method on file. This renewal ensures uninterrupted access to the valuable services and features included in your plan.

We want to ensure you have full control over your subscription. If you choose not to continue, you can cancel your subscription at any time before the renewal is processed. If a payment has already been made and you decide not to proceed, you're eligible to request a full refund, no questions asked.

📋 Subscription Summary:
Subscription Name: linux-hwmon

Company: PayPal,LLC

Product/Service: PC Life gaurd Security

Subscription Duration: 1 Year

Renewal Amount: 439.85

Should you have any questions, need assistance with managing your subscription, or want help with cancellation or billing, please don’t hesitate to reach out. Our support team is here to assist you and ensure your experience remains smooth and satisfactory. You can contact us directly at (828)-266-6592, and we’ll be happy to help.

As always, thank you for choosing PayPal,LLC. We truly value your membership and the trust you’ve placed in us. Whether you continue your journey with us or decide to part ways, we’re grateful to have had the opportunity to serve you.

Warm regards,
PayPal,LLC
📞 (828)-266-6592
