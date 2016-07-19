Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:59482 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751244AbcGSDgH (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Mon, 18 Jul 2016 23:36:07 -0400
Subject: Re: [PATCH] hwmon-ntc_thermistor: Delete an unnecessary check before
 the function call "iio_channel_release"
To: SF Markus Elfring <elfring@users.sourceforge.net>,
	linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <60ce7b63-99f8-67c2-319c-21b2d4199263@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	Julia Lawall <julia.lawall@lip6.fr>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <578DA00B.2070207@roeck-us.net>
Date: Mon, 18 Jul 2016 20:35:39 -0700
MIME-Version: 1.0
In-Reply-To: <60ce7b63-99f8-67c2-319c-21b2d4199263@users.sourceforge.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/18/2016 11:54 AM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 18 Jul 2016 20:34:41 +0200
>
> The iio_channel_release() function tests whether its argument is NULL
> and then returns immediately. Thus the test around the call is not needed.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

A much better change would be to use devm_iio_channel_get() instead of
iio_channel_get(), and to remove ntc_iio_channel_release() completely.

Guenter

