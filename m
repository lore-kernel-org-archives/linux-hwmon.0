Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:53246 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751347AbcG3PTy (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sat, 30 Jul 2016 11:19:54 -0400
Subject: Re: [PATCH v2 1/2] hwmon: adt7411: set sane values for CFG1 and CFG3
To: Michael Walle <michael@walle.cc>, linux-hwmon@vger.kernel.org
References: <1469437926-3508-1-git-send-email-michael@walle.cc>
Cc: Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <579CC57D.2030401@roeck-us.net>
Date: Sat, 30 Jul 2016 08:19:25 -0700
MIME-Version: 1.0
In-Reply-To: <1469437926-3508-1-git-send-email-michael@walle.cc>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/25/2016 02:12 AM, Michael Walle wrote:
> According to the datasheet we have to set some bits as 0 and others as 1.
> Make sure we do this for CFG1 and CFG3.
>
> Signed-off-by: Michael Walle <michael@walle.cc>

Applied.

Thanks,
Guenter

