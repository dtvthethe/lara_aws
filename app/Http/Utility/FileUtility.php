<?php

namespace App\Http\Utility;

use Illuminate\Support\Facades\Storage;

class FileUtility
{
    public static function getObjectURLFromS3(string $path): string
    {
        $adapter = Storage::disk('s3')->getAdapter();

        return $adapter->getClient()->getObjectUrl(
            $adapter->getBucket(),
            $adapter->getPathPrefix().$path
        );
    }
}
