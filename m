Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:35497 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751175AbcHTHnL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 20 Aug 2016 03:43:11 -0400
Subject: Re: [PATCH v2] hwmon: (ucd9000) support for ucd90160 sensor
To: Matt Weber <matthew.weber@rockwellcollins.com>,
        linux-hwmon@vger.kernel.org
References: <1471658925-43438-1-git-send-email-matthew.weber@rockwellcollins.com>
Cc: jdelvare@suse.com, Ronak Desai <ronak.desai@rockwellcollins.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <d7b741c4-e035-d4c6-9d52-638ddbc4fa16@roeck-us.net>
Date: Sat, 20 Aug 2016 00:43:08 -0700
MIME-Version: 1.0
In-Reply-To: <1471658925-43438-1-git-send-email-matthew.weber@rockwellcollins.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 08/19/2016 07:08 PM, Matt Weber wrote:
> ucd90160 sensor reused existing register layout so just a
> id addition was required.
>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
> ---

Applied to -next, with some changes: Updated description, ordered chip type
alphabetically, added documentation.

Guenter

