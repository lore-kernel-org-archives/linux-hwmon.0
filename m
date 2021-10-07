Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 917AEC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 Oct 2021 14:20:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C12F610E6
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 Oct 2021 14:20:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241977AbhJGOWM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 7 Oct 2021 10:22:12 -0400
Received: from mout.gmx.net ([212.227.15.19]:47975 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233362AbhJGOWL (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 7 Oct 2021 10:22:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1633616403;
        bh=fLWtbxnHrDMDNhhgtCLeROtZovfBVoqBiBhdaqpUAfk=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Biv6d6cSM0Wxa+8i4V0jMX4aMkbS3hkbk2FpBvQU9l2Wt5v0K4YDDI7RQxN4Q58EH
         lUCf9nt+JXwqp04OIrOony0TtfP0oP98cWdstnP6Ttbq//hKZz61/pOM8L0zGpE11i
         AjK6wf/xdCo7mrNIVYxpK0zRePoPnwNmgUi6R5xQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.2.42] ([91.137.126.34]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MD9X9-1mh2yR3a2j-0098Lh; Thu, 07
 Oct 2021 16:20:02 +0200
Subject: Re: i5k_amb temp_mid replacement
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <7aaa2734-514d-3752-01f1-fe3895718f55@gmx.de>
 <20211002140451.GA34532@roeck-us.net>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <ce066c64-bf13-e6fa-278f-0dd6f2c2f45e@gmx.de>
Date:   Thu, 7 Oct 2021 16:20:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20211002140451.GA34532@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:gEyqo6iqjX1Yp75drlWWP6uLzLD5nT5ZGQMh8t5aEc3a4R/Zeco
 okWZZ0dAvqvpVMogNJDyoWkYkHbxus/wZ+4BELeMUcfGBuD4PYpNLCAQcyzzua4vZMFZN+4
 dVOFglJFUDD3+I5I88QPLlYN3tli611y//pAyypvvVTpzGmTyKpDSqvUWG5RfNDFW70BqlR
 aRmDAygmBXdERjrBtMbng==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bUPRnqHN3DM=:CjogQRAV/OIZ6A7FbR7iso
 9/+8y1ueijxdqIDf91ZZEKeR0JBAiCOLZxJjBT1nZd3qXZcAPZ+wKvnXRZjHnH9VojNtB5L0p
 2ReiscEbd62TrnR87DgbBJ+YTB7bMM7SYbrufyLEFjZCZO5ORBjNy5OtrJltWhdlBWQ6Skim3
 TBSHObTAq7Judq7FZinFz/bwy2ScsyB3BJFIkTJf6UPh6cHcb8+aH47rb1gJ0bqcKXvMRhvxP
 SnzgZm7dksnAEQyXYP0KQHCFMnP2EHpzQeh6LNND1SxjK5DGK91fEptkAGa7+vyRyED+m2MFw
 Rfq7TIofLr8YkGbTs6I77vVeT/snR4wg88u9Z2CXsy+Hc103Eshfz6uWRdKqpxNkUjT5Vcm80
 0YkzxzAmxFy60dLio3W/TdU9e+ZdZ/UUk0eGQ74raHmo5ZPVIbkm6O9xtYNApwKU+t7vSLYW/
 J3bruitusjRGQszo7knwR1Cie8/7000zJ+GOq6VKDB5rfpoQD9zj2kZy8m/eIkvSkofaxQfmv
 Xia7cocvyG/XfElKbDW9G8LddQcpWzO/iPnNQc8OBBXvWPhee5GPZ0A7UIzURrCKvDLZRr1KF
 mjXvnZctUY8JUFdrT8Lh931yWK5cOQ4fN1eBA+6zcpeLNbcOJ0Z1Sz+8qttdH6Ob6M+NPNIwg
 5X2pCm6s7wuJsQY+MxdjFImB/Y593ytkVE2PZSCO50nP90WEL+dixM00upI4cqYXWqa3HOo+5
 ND9zCCrXTFm4ecY50KP5ALfHsaV6/DWAl+0pE3ssbNkDAEgpEg+tP4+Xs7L5VSPZOJ6711xt6
 +MoVhzPrGg/hds01ILTiETyDxs2q2+QNKXrP2HKxtmuEuw9oyIwCw7G+7Q3YuNRQe+c8cbUXM
 A8eFMkJZdUV48mt4tKyuDndEta/JmjyGVQFPYlWhVh64HYNdPeo8W4rWrMruZ2YUC6hB+Cy8W
 uWheQ5KZfAG9/vBav3w17k4biV8hLW+kkS81lC0qPmmjpxT6pLQRa2pNhc0Q18mFCSyAAlxJM
 TXaDPul84/fhkY2RmCAzxUO3Ic1oF++4svWKFz2TTqLf6WOCO/p9b2OmTxf0TG3uWlWbJu4i6
 NUVexfi25/nlIc=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am 02.10.21 um 16:04 schrieb Guenter Roeck:
> On Fri, Oct 01, 2021 at 12:13:53AM +0200, Armin Wolf wrote:
>> Hello,
>>
>> while trying to convert i5k_temp to the new hwmon API to resolve
>> https://bugzilla.kernel.org/show_bug.cgi?id=3D208693,
>> i was asking myself whether or not temp_mid could be replaced with a
>> standard sysfs attribute?
>> Since afaik temp_mid and temp_max are both temperature limits, they
>> could potentially be replaced with
>> temp_max and temp_crit.
>>
> Quite likely. Unfortunately, the chipset documentation is not available
> to the public, so it is difficult to determine what those temperatures
> actually mean.
>
> Guenter
Darrick Wong says the chipset documentation would support such a change.
However, he fears that the changed meaning of tempX_max could confuse
userspace
programs.
But i think the current not using standard attribute names will confuse
even more
programms.
